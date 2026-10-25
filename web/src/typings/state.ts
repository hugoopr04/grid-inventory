import { Inventory } from './inventory';
import { Slot } from './slot';

export type HotbarEntry = {
  slot: number;
  name: string;
  uid?: string; // metadata.serial for weapons, metadata.id for other items
};

export type State = {
  leftInventory: Inventory;
  rightInventory: Inventory;
  itemAmount: number;
  shiftPressed: boolean;
  isBusy: boolean;
  dragRotated: boolean;
  additionalMetadata: Array<{ metadata: string; value: string }>;
  hotbar: Record<number, HotbarEntry>;
  history?: {
    leftInventory: Inventory;
    rightInventory: Inventory;
  };
};
