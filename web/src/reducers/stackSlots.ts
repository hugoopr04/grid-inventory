import { CaseReducer, PayloadAction } from '@reduxjs/toolkit';
import { getTargetInventory } from '../helpers';
import { Inventory, InventoryType, SlotWithItem, State } from '../typings';

export const stackSlotsReducer: CaseReducer<
  State,
  PayloadAction<{
    fromSlot: SlotWithItem;
    fromType: Inventory['type'];
    toSlot: SlotWithItem;
    toType: Inventory['type'];
    count: number;
  }>
> = (state, action) => {
  const { fromSlot, fromType, toSlot, toType, count } = action.payload;

  const { sourceInventory, targetInventory } = getTargetInventory(state, fromType, toType);

  const pieceWeight = fromSlot.weight / fromSlot.count;

  targetInventory.items[toSlot.slot - 1] = {
    ...targetInventory.items[toSlot.slot - 1],
    count: toSlot.count + count,
    weight: pieceWeight * (toSlot.count + count),
  };

  if (fromType === InventoryType.SHOP || fromType === InventoryType.CRAFTING) return;

  const fullyStacked = fromSlot.count - count <= 0;

  sourceInventory.items[fromSlot.slot - 1] = fullyStacked
    ? { slot: fromSlot.slot }
    : {
        ...sourceInventory.items[fromSlot.slot - 1],
        count: fromSlot.count - count,
        weight: pieceWeight * (fromSlot.count - count),
      };

  if (fromType === InventoryType.PLAYER && fullyStacked) {
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
