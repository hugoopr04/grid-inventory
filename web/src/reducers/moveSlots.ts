import { CaseReducer, PayloadAction } from '@reduxjs/toolkit';
import { getTargetInventory, itemDurability } from '../helpers';
import { Inventory, InventoryType, Slot, SlotWithItem, State } from '../typings';

export const moveSlotsReducer: CaseReducer<
  State,
  PayloadAction<{
    fromSlot: SlotWithItem;
    fromType: Inventory['type'];
    toSlot: Slot;
    toType: Inventory['type'];
    count: number;
    gridX?: number;
    gridY?: number;
    rotated?: boolean;
  }>
> = (state, action) => {
  const { fromSlot, fromType, toSlot, toType, count, gridX, gridY, rotated } = action.payload;
  const { sourceInventory, targetInventory } = getTargetInventory(state, fromType, toType);
  const pieceWeight = fromSlot.weight / fromSlot.count;
  const curTime = Math.floor(Date.now() / 1000);
  const fromItem = sourceInventory.items[fromSlot.slot - 1];

  targetInventory.items[toSlot.slot - 1] = {
    ...fromItem,
    count: count,
    weight: pieceWeight * count,
    slot: toSlot.slot,
    durability: itemDurability(fromItem.metadata, curTime),
    gridX: gridX ?? toSlot.gridX ?? 0,
    gridY: gridY ?? toSlot.gridY ?? 0,
    rotated: rotated ?? toSlot.rotated ?? false,
  };

  if (fromType === InventoryType.SHOP || fromType === InventoryType.CRAFTING) return;

  const fullyMoved = fromSlot.count - count <= 0;

  sourceInventory.items[fromSlot.slot - 1] = fullyMoved
    ? { slot: fromSlot.slot }
    : {
        ...sourceInventory.items[fromSlot.slot - 1],
        count: fromSlot.count - count,
        weight: pieceWeight * (fromSlot.count - count),
      };

  if (fromType === InventoryType.PLAYER && fullyMoved) {
    for (const key in state.hotbar) {
      if (state.hotbar[Number(key)].slot === fromSlot.slot) {
        if (toType === InventoryType.PLAYER) {
          state.hotbar[Number(key)] = { ...state.hotbar[Number(key)], slot: toSlot.slot };
        } else {
          delete state.hotbar[Number(key)];
        }
      }
    }
  }
};
