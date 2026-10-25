import React, { useCallback, useEffect, useMemo, useRef, useState } from 'react';
import { useDrop } from 'react-dnd';
import { Inventory, InventoryType, DragSource, SlotWithItem, Slot } from '../../typings';
import { useAppDispatch, useAppSelector } from '../../store';
import { assignHotbar, selectDragRotated, setDragRotated } from '../../store/inventory';
import { isSlotWithItem, canStack, getTargetInventory, getItemUrl } from '../../helpers';
import {
  DEFAULT_GRID_HEIGHT,
  DEFAULT_GRID_WIDTH,
  buildOccupancyGrid,
  canPlaceItem,
  clampPlacement,
  getEffectiveSize,
  getGridCoordsFromMouse,
  getTotalUsedCells,
  findEmptySlotNumber,
  rectsOverlap,
} from '../../helpers/grid';
import { Items } from '../../store/items';
import WeightBar from '../utils/WeightBar';
import TarkovGridItem from './TarkovGridItem';
import { onDrop } from '../../dnd/onDrop';
import { onBuy } from '../../dnd/onBuy';
import { onCraft } from '../../dnd/onCraft';
import { closeTooltip } from '../../store/tooltip';
import { fetchNui } from '../../utils/fetchNui';

const CELL_SIZE_VH = 5;

interface HoverPreview {
  gridX: number;
  gridY: number;
  w: number;
  h: number;
  valid: boolean;
}

interface HotbarSlotProps {
  slotNumber: number;
  item?: Slot;
  inventory: Inventory;
}

const HotbarSlot: React.FC<HotbarSlotProps> = ({ slotNumber, item, inventory }) => {
  const dispatch = useAppDispatch();

  const [{ isOver }, drop] = useDrop<DragSource, void, { isOver: boolean }>(
    () => ({
      accept: 'SLOT',
      drop: (source) => {
        // Only allow assigning player inventory items to hotbar
        if (source.inventory !== 'player') return;
        const fullItem = inventory.items[source.item.slot - 1];
        const uid = fullItem?.metadata?.serial || fullItem?.metadata?.id || undefined;
        dispatch(assignHotbar({ hotkey: slotNumber, slot: source.item.slot, name: source.item.name, uid }));
        fetchNui('assignHotkey', { hotkey: slotNumber, slot: source.item.slot, name: source.item.name, uid });
      },
      collect: (monitor) => ({
        isOver: monitor.isOver(),
      }),
    }),
    [inventory, slotNumber]
  );

  const handleClear = (e: React.MouseEvent) => {
    e.preventDefault();
    dispatch(assignHotbar({ hotkey: slotNumber, slot: null }));
    fetchNui('assignHotkey', { hotkey: slotNumber, slot: null });
  };

  return (
    <div
      ref={(el) => { drop(el); }}
      className={`hotbar-grid-cell ${isOver ? 'cell-hover' : ''}`}
      onContextMenu={handleClear}
    >
      <div className="hotbar-slot-key">{slotNumber}</div>
      {item && isSlotWithItem(item) && (
        <div className="hotbar-item-preview">
          <img src={getItemUrl(item as SlotWithItem) || ''} alt="" className="hotbar-item-image" />
        </div>
      )}
    </div>
  );
};

const InventoryGrid: React.FC<{ inventory: Inventory }> = ({ inventory }) => {
  const dispatch = useAppDispatch();
  const gridRef = useRef<HTMLDivElement>(null);
  const dragRotated = useAppSelector(selectDragRotated);
  const isBusy = useAppSelector((state) => state.inventory.isBusy);
  const [hoverPreview, setHoverPreview] = useState<HoverPreview | null>(null);
  const hoverPreviewRef = useRef<HoverPreview | null>(null);
  const hotbar = useAppSelector((state) => state.inventory.hotbar) || {};
  const leftInventory = useAppSelector((state) => state.inventory.leftInventory);
  const rightInventory = useAppSelector((state) => state.inventory.rightInventory);

  const gridWidth = inventory.gridWidth || DEFAULT_GRID_WIDTH;
  const gridHeight = inventory.gridHeight || DEFAULT_GRID_HEIGHT;

  const usedCells = useMemo(() => getTotalUsedCells(inventory.items), [inventory.items]);
  const totalCells = gridWidth * gridHeight;
  const spacePercent = totalCells > 0 ? (usedCells / totalCells) * 100 : 0;

  const occupancy = useMemo(
    () => buildOccupancyGrid(inventory.items, gridWidth, gridHeight),
    [inventory.items, gridWidth, gridHeight]
  );

  const getCellSize = useCallback((): number => {
    return (window.innerHeight * CELL_SIZE_VH) / 100;
  }, []);

  const computeHover = useCallback(
    (source: DragSource, clientX: number, clientY: number, rotated: boolean) => {
      if (!gridRef.current) return null;

      const rect = gridRef.current.getBoundingClientRect();
      const cellSize = getCellSize();

      const { w, h } = getEffectiveSize(source.item.name, rotated);

      const raw = getGridCoordsFromMouse(
        clientX,
        clientY,
        rect,
        cellSize,
        gridWidth,
        gridHeight,
        gridRef.current.scrollLeft,
        gridRef.current.scrollTop
      );
      const offsetX = Math.floor(w / 2);
      const offsetY = Math.floor(h / 2);

      const clamped = clampPlacement(raw.gridX - offsetX, raw.gridY - offsetY, w, h, gridWidth, gridHeight);

      const sourceInventory = source.inventory === 'player' ? leftInventory : rightInventory;
      const targetInventory = inventory;

      const sourceSlot = sourceInventory.items[source.item.slot - 1];

      // Build target occupancy grid excluding the source item if it is in the target inventory
      const targetOccupancy = buildOccupancyGrid(
        targetInventory.items.filter((item) =>
          isSlotWithItem(item) &&
          !(sourceInventory.id === targetInventory.id && item.slot === source.item.slot)
        ),
        gridWidth,
        gridHeight
      );

      const { fits, overlappingSlots } = canPlaceItem(
        targetOccupancy,
        clamped.gridX,
        clamped.gridY,
        w,
        h,
        gridWidth,
        gridHeight
      );

      let valid = fits && overlappingSlots.size <= 1;

      // If it overlaps with exactly one item, check if the swap is valid (i.e. the overlapped item fits in source position)
      if (valid && overlappingSlots.size === 1 && sourceSlot && isSlotWithItem(sourceSlot)) {
        const targetSlotNumber = overlappingSlots.values().next().value!;
        const targetItem = targetInventory.items[targetSlotNumber - 1];

        if (targetItem && isSlotWithItem(targetItem)) {
          const sourceData = Items[sourceSlot.name];
          const isStack = sourceData?.stack && canStack(sourceSlot, targetItem);

          if (!isStack) {
            // Check if the target item fits in the source item's original position
            const sourceOccupancy = buildOccupancyGrid(
              sourceInventory.items.filter((item) =>
                isSlotWithItem(item) &&
                item.slot !== sourceSlot.slot &&
                !(sourceInventory.id === targetInventory.id && item.slot === targetItem.slot)
              ),
              sourceInventory.gridWidth || DEFAULT_GRID_WIDTH,
              sourceInventory.gridHeight || DEFAULT_GRID_HEIGHT
            );

            const targetSize = getEffectiveSize(targetItem.name, targetItem.rotated ?? false);
            const targetPlacement = canPlaceItem(
              sourceOccupancy,
              sourceSlot.gridX!,
              sourceSlot.gridY!,
              targetSize.w,
              targetSize.h,
              sourceInventory.gridWidth || DEFAULT_GRID_WIDTH,
              sourceInventory.gridHeight || DEFAULT_GRID_HEIGHT
            );

            if (!targetPlacement.fits || targetPlacement.overlappingSlots.size > 0) {
              valid = false;
            }

            if (
              valid &&
              sourceInventory.id === targetInventory.id &&
              rectsOverlap(
                clamped.gridX,
                clamped.gridY,
                w,
                h,
                sourceSlot.gridX!,
                sourceSlot.gridY!,
                targetSize.w,
                targetSize.h
              )
            ) {
              valid = false;
            }
          }
        }
      }

      return {
        gridX: clamped.gridX,
        gridY: clamped.gridY,
        w,
        h,
        valid,
      };
    },
    [occupancy, gridWidth, gridHeight, getCellSize, leftInventory, rightInventory, inventory]
  );

  const handleDrop = useCallback(
    (source: DragSource, gridX: number, gridY: number, w: number, h: number) => {
      dispatch(closeTooltip());

      const sourceInventory = source.inventory === 'player' ? leftInventory : rightInventory;
      const targetInventory = inventory;

      const sourceSlot = sourceInventory.items[source.item.slot - 1];

      // Build target occupancy grid excluding the source item if it is in the target inventory
      const targetOccupancy = buildOccupancyGrid(
        targetInventory.items.filter((item) =>
          isSlotWithItem(item) &&
          !(sourceInventory.id === targetInventory.id && item.slot === source.item.slot)
        ),
        gridWidth,
        gridHeight
      );

      const { fits, overlappingSlots } = canPlaceItem(
        targetOccupancy,
        gridX,
        gridY,
        w,
        h,
        gridWidth,
        gridHeight
      );

      let valid = fits && overlappingSlots.size <= 1;

      // Swap validation
      if (valid && overlappingSlots.size === 1 && sourceSlot && isSlotWithItem(sourceSlot)) {
        const targetSlotNumber = overlappingSlots.values().next().value!;
        const targetItem = targetInventory.items[targetSlotNumber - 1];

        if (targetItem && isSlotWithItem(targetItem)) {
          const sourceData = Items[sourceSlot.name];
          const isStack = sourceData?.stack && canStack(sourceSlot, targetItem);

          if (!isStack) {
            const sourceOccupancy = buildOccupancyGrid(
              sourceInventory.items.filter((item) =>
                isSlotWithItem(item) &&
                item.slot !== sourceSlot.slot &&
                !(sourceInventory.id === targetInventory.id && item.slot === targetItem.slot)
              ),
              sourceInventory.gridWidth || DEFAULT_GRID_WIDTH,
              sourceInventory.gridHeight || DEFAULT_GRID_HEIGHT
            );

            const targetSize = getEffectiveSize(targetItem.name, targetItem.rotated ?? false);
            const targetPlacement = canPlaceItem(
              sourceOccupancy,
              sourceSlot.gridX!,
              sourceSlot.gridY!,
              targetSize.w,
              targetSize.h,
              sourceInventory.gridWidth || DEFAULT_GRID_WIDTH,
              sourceInventory.gridHeight || DEFAULT_GRID_HEIGHT
            );

            if (!targetPlacement.fits || targetPlacement.overlappingSlots.size > 0) {
              valid = false;
            }

            if (
              valid &&
              sourceInventory.id === targetInventory.id &&
              rectsOverlap(
                gridX,
                gridY,
                w,
                h,
                sourceSlot.gridX!,
                sourceSlot.gridY!,
                targetSize.w,
                targetSize.h
              )
            ) {
              valid = false;
            }
          }
        }
      }

      if (!valid) return;

      // Find the target slot
      let targetSlotNumber: number;
      let targetItem = undefined;

      if (overlappingSlots.size === 1) {
        // Swap or stack with existing item
        targetSlotNumber = overlappingSlots.values().next().value!;
        targetItem = inventory.items[targetSlotNumber - 1];
      } else {
        // Empty space - find an available slot number
        targetSlotNumber = findEmptySlotNumber(inventory.items);
      }

      const dropTarget = {
        inventory: inventory.type,
        item: { slot: targetSlotNumber },
        gridX,
        gridY,
        rotated: dragRotated,
      };

      // Route to appropriate handler
      switch (source.inventory) {
        case InventoryType.SHOP:
          onBuy(source, dropTarget);
          break;
        case InventoryType.CRAFTING:
          onCraft(source, dropTarget);
          break;
        default:
          onDrop(source, dropTarget, gridX, gridY, dragRotated);
          break;
      }
    },
    [occupancy, gridWidth, gridHeight, inventory, dragRotated, dispatch, leftInventory, rightInventory]
  );

  const [{ isOver }, drop] = useDrop<DragSource, void, { isOver: boolean }>(
    () => ({
      accept: 'SLOT',
      collect: (monitor) => ({
        isOver: monitor.isOver(),
      }),
      hover: (source, monitor) => {
        const offset = monitor.getClientOffset();
        if (!offset) return;
        const preview = computeHover(source, offset.x, offset.y, dragRotated);
        if (preview) {
          hoverPreviewRef.current = preview;
          setHoverPreview(preview);
        }
      },
      drop: (source, monitor) => {
        const hp = hoverPreviewRef.current;
        if (!hp) return;
        handleDrop(source, hp.gridX, hp.gridY, hp.w, hp.h);
        hoverPreviewRef.current = null;
        setHoverPreview(null);
      },
      canDrop: (source) => {
        return inventory.type !== InventoryType.SHOP && inventory.type !== InventoryType.CRAFTING;
      },
    }),
    [computeHover, handleDrop, dragRotated, inventory.type]
  );

  useEffect(() => {
    if (!isOver) setHoverPreview(null);
  }, [isOver]);

  const mergedRef = useCallback(
    (el: HTMLDivElement | null) => {
      (gridRef as React.MutableRefObject<HTMLDivElement | null>).current = el;
      drop(el);
    },
    [drop]
  );

  // Filter to only items with data
  const itemsWithData = useMemo(
    () => inventory.items.filter((item) => isSlotWithItem(item) && item.gridX !== undefined) as SlotWithItem[],
    [inventory.items]
  );

  return (
    <div className={`inventory-grid-wrapper inventory-type-${inventory.type}`} style={{ pointerEvents: isBusy ? 'none' : 'auto' }}>
      <div>
        <div className="inventory-grid-header-wrapper">
          <p>{inventory.label}</p>
          <p>
            {usedCells}/{totalCells}
          </p>
        </div>
        <WeightBar percent={spacePercent} />
      </div>
      {inventory.type === 'player' && (
        <div className="player-hotbar-container">
          {Array.from({ length: 5 }).map((_, i) => {
            const slotNumber = i + 1;
            const assignedSlot = hotbar[slotNumber];
            const item = assignedSlot !== undefined ? inventory.items[assignedSlot.slot - 1] : undefined;
            return (
              <HotbarSlot
                key={`hotbar-slot-${slotNumber}`}
                slotNumber={slotNumber}
                item={item}
                inventory={inventory}
              />
            );
          })}
        </div>
      )}
      <div
        ref={mergedRef}
        className="tarkov-grid-container"
        style={
          {
            '--grid-cols': gridWidth,
            '--grid-rows': gridHeight,
          } as React.CSSProperties
        }
      >
        {/* Background cells */}
        {Array.from({ length: gridHeight }).map((_, y) =>
          Array.from({ length: gridWidth }).map((_, x) => (
            <div
              key={`cell-${x}-${y}`}
              className="tarkov-grid-cell"
              style={{
                gridColumn: `${x + 1}`,
                gridRow: `${y + 1}`,
              }}
            />
          ))
        )}

        {/* Items */}
        {itemsWithData.map((item) => {
          const { w, h } = getEffectiveSize(item.name, item.rotated ?? false);
          return (
            <TarkovGridItem
              key={`item-${item.slot}`}
              item={item}
              w={w}
              h={h}
              inventoryType={inventory.type}
              inventoryGroups={inventory.groups}
              inventoryId={inventory.id}
              searchState={inventory.searchState}
            />
          );
        })}

        {/* Hover preview overlay */}
        {hoverPreview && isOver && (
          <div
            className={`tarkov-grid-preview ${hoverPreview.valid ? 'preview-valid' : 'preview-invalid'}`}
            style={{
              gridColumn: `${hoverPreview.gridX + 1} / span ${hoverPreview.w}`,
              gridRow: `${hoverPreview.gridY + 1} / span ${hoverPreview.h}`,
            }}
          />
        )}
      </div>
    </div>
  );
};

export default InventoryGrid;
