import { canStack, findAvailableSlot, getTargetInventory, isSlotWithItem } from '../helpers';
import {
  DEFAULT_GRID_HEIGHT,
  DEFAULT_GRID_WIDTH,
  buildOccupancyGrid,
  findFirstAvailablePosition,
  getEffectiveSize,
} from '../helpers/grid';
import { validateMove } from '../thunks/validateItems';
import { store } from '../store';
import { DragSource, DropTarget, HotbarEntry, InventoryType, SlotWithItem } from '../typings';
import { moveSlots, stackSlots, swapSlots } from '../store/inventory';
import { Items } from '../store/items';
import { fetchNui } from '../utils/fetchNui';

function syncHotbarToLua(oldHotbar: Record<number, HotbarEntry>, newHotbar: Record<number, HotbarEntry>) {
  const allKeys = new Set([...Object.keys(oldHotbar), ...Object.keys(newHotbar)].map(Number));
  for (const key of allKeys) {
    const oldEntry = oldHotbar[key];
    const newEntry = newHotbar[key];
    if (oldEntry?.slot !== newEntry?.slot) {
      if (!newEntry) {
        fetchNui('assignHotkey', { hotkey: key, slot: null });
      } else {
        fetchNui('assignHotkey', { hotkey: key, slot: newEntry.slot, name: newEntry.name, uid: newEntry.uid });
      }
    }
  }
}

export const onDrop = (
  source: DragSource,
  target?: DropTarget,
  gridX?: number,
  gridY?: number,
  rotated?: boolean
) => {
  const { inventory: state } = store.getState();

  const { sourceInventory, targetInventory } = getTargetInventory(state, source.inventory, target?.inventory);

  const sourceSlot = sourceInventory.items[source.item.slot - 1] as SlotWithItem;

  const sourceData = Items[sourceSlot.name];

  if (sourceData === undefined) return console.error(`${sourceSlot.name} item data undefined!`);

  // If dragging from container slot
  if (sourceSlot.metadata?.container !== undefined) {
    // Prevent storing container in container
    if (targetInventory.type === InventoryType.CONTAINER)
      return console.log(`Cannot store container ${sourceSlot.name} inside another container`);

    // Prevent dragging of container slot when opened
    if (state.rightInventory.id === sourceSlot.metadata.container)
      return console.log(`Cannot move container ${sourceSlot.name} when opened`);
  }

  const targetSlot = target
    ? targetInventory.items[target.item.slot - 1] || { slot: target.item.slot }
    : findAvailableSlot(sourceSlot, sourceData, targetInventory.items);

  if (targetSlot === undefined) return console.error('Target slot undefined!');

  // If dropping on container slot when opened
  if (targetSlot.metadata?.container !== undefined && state.rightInventory.id === targetSlot.metadata.container)
    return console.log(`Cannot swap item ${sourceSlot.name} with container ${targetSlot.name} when opened`);

  const count =
    state.shiftPressed && sourceSlot.count > 1 && sourceInventory.type !== 'shop'
      ? Math.floor(sourceSlot.count / 2)
      : state.itemAmount === 0 || state.itemAmount > sourceSlot.count
        ? sourceSlot.count
        : state.itemAmount;

  const data = {
    fromSlot: sourceSlot,
    toSlot: targetSlot,
    fromType: sourceInventory.type,
    toType: targetInventory.type,
    count: count,
  };

  let finalGridX = gridX ?? target?.gridX;
  let finalGridY = gridY ?? target?.gridY;
  let finalRotated = rotated ?? target?.rotated ?? false;

  if (finalGridX === undefined || finalGridY === undefined) {
    const gridWidth = targetInventory.gridWidth || DEFAULT_GRID_WIDTH;
    const gridHeight = targetInventory.gridHeight || DEFAULT_GRID_HEIGHT;
    // BUGFIX: Exclude the source item from the occupancy grid when it's in the same inventory
    // Without this, the source item's old position is still counted as "occupied",
    // causing the grid to think there's less free space than there actually is
    const sameInventory = sourceInventory.id === targetInventory.id;
    const otherItems = targetInventory.items.filter(
      (item) => item && item.name && item.gridX !== undefined && item.gridY !== undefined
        && !(sameInventory && item.slot === sourceSlot.slot)
    );
    const occupancy = buildOccupancyGrid(otherItems, gridWidth, gridHeight);
    const { w, h } = getEffectiveSize(sourceSlot.name, false);
    // Tries the upright orientation first and falls back to rotated.
    const pos = findFirstAvailablePosition(occupancy, w, h, gridWidth, gridHeight);

    if (pos) {
      finalGridX = pos.gridX;
      finalGridY = pos.gridY;
      finalRotated = pos.rotated;
    }
  }

  // Send validation to server
  store.dispatch(
    validateMove({
      ...data,
      fromSlot: sourceSlot.slot,
      toSlot: targetSlot.slot,
      gridX: finalGridX,
      gridY: finalGridY,
      rotated: finalRotated,
    })
  );

  // Optimistic UI update
  const hotbarBefore = store.getState().inventory.hotbar;

  if (isSlotWithItem(targetSlot, true)) {
    if (sourceData.stack && canStack(sourceSlot, targetSlot)) {
      store.dispatch(
        stackSlots({
          ...data,
          toSlot: targetSlot,
        })
      );
    } else {
      // Swap: the source item goes to target position, target item goes to source position
      store.dispatch(
        swapSlots({
          ...data,
          toSlot: targetSlot,
          toGridX: finalGridX,
          toGridY: finalGridY,
          toRotated: finalRotated,
          fromGridX: sourceSlot.gridX,
          fromGridY: sourceSlot.gridY,
          fromRotated: sourceSlot.rotated,
        })
      );
    }
  } else {
    store.dispatch(
      moveSlots({
        ...data,
        gridX: finalGridX ?? 0,
        gridY: finalGridY ?? 0,
        rotated: finalRotated,
      })
    );
  }

  syncHotbarToLua(hotbarBefore, store.getState().inventory.hotbar);
};
