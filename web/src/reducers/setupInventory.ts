import { CaseReducer, PayloadAction } from '@reduxjs/toolkit';
import { getItemData, isSlotWithItem, itemDurability } from '../helpers';
import {
  DEFAULT_GRID_HEIGHT,
  DEFAULT_GRID_WIDTH,
  buildOccupancyGrid,
  findFirstAvailablePosition,
  getEffectiveSize,
} from '../helpers/grid';
import { Items } from '../store/items';
import { HotbarEntry, Inventory, State } from '../typings';

export const setupInventoryReducer: CaseReducer<
  State,
  PayloadAction<{
    leftInventory?: Inventory;
    rightInventory?: Inventory;
    hotbar?: Record<number, HotbarEntry>;
  }>
> = (state, action) => {
  const { leftInventory, rightInventory, hotbar } = action.payload;
  const curTime = Math.floor(Date.now() / 1000);

  // Restore persisted hotbar assignments sent from the client.
  if (hotbar) state.hotbar = hotbar;

  if (leftInventory) {
    const gridWidth = leftInventory.gridWidth || DEFAULT_GRID_WIDTH;
    const initialGridHeight = Math.max(leftInventory.gridHeight || DEFAULT_GRID_HEIGHT, Math.ceil((leftInventory.slots || 0) / gridWidth));

    // Collect actual items (with names) and assign grid positions
    const actualItems = Object.values(leftInventory.items).filter((item) => item && item.name);

    // Ensure all items have item data
    for (const item of actualItems) {
      if (item.name && typeof Items[item.name] === 'undefined') {
        getItemData(item.name);
      }
      item.durability = itemDurability(item.metadata, curTime);
    }

    // Determine initial required height based on predefined item coordinates
    let currentGridHeight = initialGridHeight;
    for (const item of actualItems) {
      if (item.gridX !== undefined && item.gridY !== undefined) {
        const { h } = getEffectiveSize(item.name!, item.rotated ?? false);
        if (item.gridY + h > currentGridHeight) {
          currentGridHeight = item.gridY + h;
        }
      }
    }

    // Auto-place items that don't have grid positions
    let occupancy = buildOccupancyGrid(
      actualItems.filter((i) => i.gridX !== undefined && i.gridY !== undefined),
      gridWidth,
      currentGridHeight
    );

    for (const item of actualItems) {
      if (item.gridX === undefined || item.gridY === undefined) {
        const { w: baseW, h: baseH } = getEffectiveSize(item.name!, false);
        let pos = findFirstAvailablePosition(occupancy, baseW, baseH, gridWidth, currentGridHeight);
        while (!pos) {
          occupancy.push(Array(gridWidth).fill(null));
          currentGridHeight++;
          pos = findFirstAvailablePosition(occupancy, baseW, baseH, gridWidth, currentGridHeight);
        }
        item.gridX = pos.gridX;
        item.gridY = pos.gridY;
        item.rotated = pos.rotated;
        // Mark cells as occupied, honouring the orientation the position was found for
        const w = pos.rotated ? baseH : baseW;
        const h = pos.rotated ? baseW : baseH;
        for (let dy = 0; dy < h; dy++) {
          for (let dx = 0; dx < w; dx++) {
            const x = pos.gridX + dx;
            const y = pos.gridY + dy;
            if (x < gridWidth && y < currentGridHeight) {
              occupancy[y][x] = item.slot;
            }
          }
        }
      }
      if (item.rotated === undefined) item.rotated = false;
    }

    // Build the full items array with empty slots filling remaining space
    const totalSlots = Math.max(leftInventory.slots || 0, gridWidth * currentGridHeight);
    const items = Array.from(Array(totalSlots), (_, index) => {
      const item = actualItems.find((item) => item?.slot === index + 1);
      return item || { slot: index + 1 };
    });

    state.leftInventory = {
      ...leftInventory,
      gridWidth,
      gridHeight: currentGridHeight,
      items,
    };
  }

  if (rightInventory) {
    const gridWidth = rightInventory.gridWidth || DEFAULT_GRID_WIDTH;
    const initialGridHeight = Math.max(rightInventory.gridHeight || DEFAULT_GRID_HEIGHT, Math.ceil((rightInventory.slots || 0) / gridWidth));

    const actualItems = Object.values(rightInventory.items).filter((item) => item && item.name);

    for (const item of actualItems) {
      if (item.name && typeof Items[item.name] === 'undefined') {
        getItemData(item.name);
      }
      item.durability = itemDurability(item.metadata, curTime);
    }

    // Determine initial required height based on predefined item coordinates
    let currentGridHeight = initialGridHeight;
    for (const item of actualItems) {
      if (item.gridX !== undefined && item.gridY !== undefined) {
        const { h } = getEffectiveSize(item.name!, item.rotated ?? false);
        if (item.gridY + h > currentGridHeight) {
          currentGridHeight = item.gridY + h;
        }
      }
    }

    // Auto-place for right inventory items
    let occupancy = buildOccupancyGrid(
      actualItems.filter((i) => i.gridX !== undefined && i.gridY !== undefined),
      gridWidth,
      currentGridHeight
    );

    for (const item of actualItems) {
      if (item.gridX === undefined || item.gridY === undefined) {
        const { w: baseW, h: baseH } = getEffectiveSize(item.name!, false);
        let pos = findFirstAvailablePosition(occupancy, baseW, baseH, gridWidth, currentGridHeight);
        while (!pos) {
          occupancy.push(Array(gridWidth).fill(null));
          currentGridHeight++;
          pos = findFirstAvailablePosition(occupancy, baseW, baseH, gridWidth, currentGridHeight);
        }
        item.gridX = pos.gridX;
        item.gridY = pos.gridY;
        item.rotated = pos.rotated;
        const w = pos.rotated ? baseH : baseW;
        const h = pos.rotated ? baseW : baseH;
        for (let dy = 0; dy < h; dy++) {
          for (let dx = 0; dx < w; dx++) {
            const x = pos.gridX + dx;
            const y = pos.gridY + dy;
            if (x < gridWidth && y < currentGridHeight) {
              occupancy[y][x] = item.slot;
            }
          }
        }
      }
      if (item.rotated === undefined) item.rotated = false;
    }

    const totalSlots = Math.max(rightInventory.slots || 0, gridWidth * currentGridHeight);
    const items = Array.from(Array(totalSlots), (_, index) => {
      const item = actualItems.find((item) => item?.slot === index + 1);
      return item || { slot: index + 1 };
    });

    state.rightInventory = {
      ...rightInventory,
      gridWidth,
      gridHeight: currentGridHeight,
      items,
    };
  }

  state.shiftPressed = false;
  state.isBusy = false;
  state.dragRotated = false;
};
