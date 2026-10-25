import { Inventory, Slot, SlotWithItem } from '../typings';
import { Items } from '../store/items';
import { isSlotWithItem } from './index';

// Default grid dimensions, used when an inventory doesn't send its own.
// Keep in sync with the inventory:gridWidth / inventory:gridHeight convars.
export const DEFAULT_GRID_WIDTH = 7;
export const DEFAULT_GRID_HEIGHT = 8;

export function getItemSize(itemName: string): { sizeX: number; sizeY: number } {
  const data = Items[itemName];
  return {
    sizeX: data?.sizeX ?? 1,
    sizeY: data?.sizeY ?? 1,
  };
}

export function getEffectiveSize(itemName: string, rotated: boolean): { w: number; h: number } {
  const { sizeX, sizeY } = getItemSize(itemName);
  return rotated ? { w: sizeY, h: sizeX } : { w: sizeX, h: sizeY };
}

export function rectsOverlap(
  x1: number,
  y1: number,
  w1: number,
  h1: number,
  x2: number,
  y2: number,
  w2: number,
  h2: number
): boolean {
  return x1 < x2 + w2 && x1 + w1 > x2 && y1 < y2 + h2 && y1 + h1 > y2;
}


// Each cell stores the slot number of the item occupying it, or null
export type OccupancyGrid = (number | null)[][];

export function buildOccupancyGrid(items: Slot[], gridWidth: number, gridHeight: number): OccupancyGrid {
  const grid: OccupancyGrid = Array.from({ length: gridHeight }, () => Array(gridWidth).fill(null));

  for (const item of items) {
    if (!isSlotWithItem(item) || item.gridX === undefined || item.gridY === undefined) continue;

    const { w, h } = getEffectiveSize(item.name, item.rotated ?? false);

    for (let dy = 0; dy < h; dy++) {
      for (let dx = 0; dx < w; dx++) {
        const x = (item.gridX ?? 0) + dx;
        const y = (item.gridY ?? 0) + dy;
        if (x >= 0 && x < gridWidth && y >= 0 && y < gridHeight) {
          grid[y][x] = item.slot;
        }
      }
    }
  }

  return grid;
}

export function canPlaceItem(
  occupancy: OccupancyGrid,
  gridX: number,
  gridY: number,
  w: number,
  h: number,
  gridWidth: number,
  gridHeight: number,
  ignoreSlot?: number
): { fits: boolean; overlappingSlots: Set<number> } {
  const overlappingSlots = new Set<number>();

  // Out of bounds
  if (gridX < 0 || gridY < 0 || gridX + w > gridWidth || gridY + h > gridHeight) {
    return { fits: false, overlappingSlots };
  }

  for (let dy = 0; dy < h; dy++) {
    for (let dx = 0; dx < w; dx++) {
      const cellSlot = occupancy[gridY + dy][gridX + dx];
      if (cellSlot !== null && cellSlot !== ignoreSlot) {
        overlappingSlots.add(cellSlot);
      }
    }
  }

  return { fits: true, overlappingSlots };
}

// Finds the first free position for an item, trying the upright orientation
// first and then the rotated one. `w`/`h` are the item's UNROTATED size; the
// returned `rotated` flag says which orientation the position was found for, so
// callers must apply it when they store the placement and mark cells as used.
export function findFirstAvailablePosition(
  occupancy: OccupancyGrid,
  w: number,
  h: number,
  gridWidth: number,
  gridHeight: number,
  ignoreSlot?: number
): { gridX: number; gridY: number; rotated: boolean } | null {
  const orientations: { w: number; h: number; rotated: boolean }[] =
    w === h ? [{ w, h, rotated: false }] : [
      { w, h, rotated: false },
      { w: h, h: w, rotated: true },
    ];

  for (const o of orientations) {
    for (let y = 0; y <= gridHeight - o.h; y++) {
      for (let x = 0; x <= gridWidth - o.w; x++) {
        const { fits, overlappingSlots } = canPlaceItem(occupancy, x, y, o.w, o.h, gridWidth, gridHeight, ignoreSlot);
        if (fits && overlappingSlots.size === 0) {
          return { gridX: x, gridY: y, rotated: o.rotated };
        }
      }
    }
  }

  return null;
}

export function getGridCoordsFromMouse(
  mouseX: number,
  mouseY: number,
  gridRect: DOMRect,
  cellSize: number,
  gridWidth: number,
  gridHeight: number,
  scrollLeft: number = 0,
  scrollTop: number = 0
): { gridX: number; gridY: number } {
  const relX = mouseX - gridRect.left + scrollLeft;
  const relY = mouseY - gridRect.top + scrollTop;
  return {
    gridX: Math.max(0, Math.min(Math.floor(relX / cellSize), gridWidth - 1)),
    gridY: Math.max(0, Math.min(Math.floor(relY / cellSize), gridHeight - 1)),
  };
}

export function getTotalUsedCells(items: Slot[]): number {
  let total = 0;
  for (const item of items) {
    if (!isSlotWithItem(item)) continue;
    const { w, h } = getEffectiveSize(item.name, item.rotated ?? false);
    total += w * h;
  }
  return total;
}

export function clampPlacement(
  gridX: number,
  gridY: number,
  w: number,
  h: number,
  gridWidth: number,
  gridHeight: number
): { gridX: number; gridY: number } {
  return {
    gridX: Math.max(0, Math.min(gridX, gridWidth - w)),
    gridY: Math.max(0, Math.min(gridY, gridHeight - h)),
  };
}

export function findEmptySlotNumber(items: Slot[], minSlot: number = 1): number {
  const usedSlots = new Set(items.filter((i) => i.name !== undefined).map((i) => i.slot));
  for (let i = minSlot; i <= items.length + minSlot; i++) {
    if (!usedSlots.has(i)) return i;
  }
  return items.length + minSlot;
}
