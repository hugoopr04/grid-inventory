import { Inventory } from './inventory';
import { Slot, SlotWithItem } from './slot';

export type DragSource = {
  item: Pick<SlotWithItem, 'slot' | 'name'>;
  inventory: Inventory['type'];
  image?: string;
  sizeX: number;
  sizeY: number;
  rotated: boolean;
  gridX: number;
  gridY: number;
};

export type DropTarget = {
  item: Pick<Slot, 'slot'>;
  inventory: Inventory['type'];
  gridX?: number;
  gridY?: number;
  rotated?: boolean;
};
