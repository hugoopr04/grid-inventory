import { CaseReducer, PayloadAction } from '@reduxjs/toolkit';
import { getTargetInventory, itemDurability } from '../helpers';
import { Inventory, InventoryType, SlotWithItem, State } from '../typings';

export const swapSlotsReducer: CaseReducer<
  State,
  PayloadAction<{
    fromSlot: SlotWithItem;
    fromType: Inventory['type'];
    toSlot: SlotWithItem;
    toType: Inventory['type'];
    fromGridX?: number;
    fromGridY?: number;
    fromRotated?: boolean;
    toGridX?: number;
    toGridY?: number;
    toRotated?: boolean;
  }>
> = (state, action) => {
  const { fromSlot, fromType, toSlot, toType, fromGridX, fromGridY, fromRotated, toGridX, toGridY, toRotated } =
    action.payload;
  const { sourceInventory, targetInventory } = getTargetInventory(state, fromType, toType);
  const curTime = Math.floor(Date.now() / 1000);

  [sourceInventory.items[fromSlot.slot - 1], targetInventory.items[toSlot.slot - 1]] = [
    {
      ...targetInventory.items[toSlot.slot - 1],
      slot: fromSlot.slot,
      durability: itemDurability(toSlot.metadata, curTime),
      gridX: fromGridX ?? fromSlot.gridX,
      gridY: fromGridY ?? fromSlot.gridY,
      rotated: fromRotated ?? fromSlot.rotated,
    },
    {
      ...sourceInventory.items[fromSlot.slot - 1],
      slot: toSlot.slot,
      durability: itemDurability(fromSlot.metadata, curTime),
      gridX: toGridX ?? toSlot.gridX,
      gridY: toGridY ?? toSlot.gridY,
      rotated: toRotated ?? toSlot.rotated,
    },
  ];

  const fromIsPlayer = fromType === InventoryType.PLAYER;
  const toIsPlayer = toType === InventoryType.PLAYER;

  if (fromIsPlayer && toIsPlayer) {
    for (const key in state.hotbar) {
      const k = Number(key);
      if (state.hotbar[k].slot === fromSlot.slot) {
        state.hotbar[k] = { ...state.hotbar[k], slot: toSlot.slot };
      } else if (state.hotbar[k].slot === toSlot.slot) {
        state.hotbar[k] = { ...state.hotbar[k], slot: fromSlot.slot };
      }
    }
  } else if (fromIsPlayer) {
    for (const key in state.hotbar) {
      if (state.hotbar[Number(key)].slot === fromSlot.slot) {
        delete state.hotbar[Number(key)];
      }
    }
  } else if (toIsPlayer) {
    for (const key in state.hotbar) {
      if (state.hotbar[Number(key)].slot === toSlot.slot) {
        delete state.hotbar[Number(key)];
      }
    }
  }
};
