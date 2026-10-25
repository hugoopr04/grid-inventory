import React, { useCallback, useRef, useState, useEffect } from 'react';
import { useDrag, useDragDropManager } from 'react-dnd';
import { DragSource, Inventory, InventoryType, SlotWithItem } from '../../typings';
import { useAppDispatch, useAppSelector } from '../../store';
import { selectDragRotated, setDragRotated, markSlotSearched } from '../../store/inventory';
import { canCraftItem, canPurchaseItem, getItemUrl, isSlotWithItem } from '../../helpers';
import { getEffectiveSize, getItemSize } from '../../helpers/grid';
import { Items } from '../../store/items';
import { onUse } from '../../dnd/onUse';
import { onDrop } from '../../dnd/onDrop';
import { closeTooltip, openTooltip } from '../../store/tooltip';
import { openContextMenu } from '../../store/contextMenu';
import WeightBar from '../utils/WeightBar';
import { Locale } from '../../store/locale';
import { searchDuration as SEARCH_DURATION_MS } from '../../store/searchDuration';
import useNuiEvent from '../../hooks/useNuiEvent';
import { ItemsPayload } from '../../reducers/refreshSlots';
import { fetchNui } from '../../utils/fetchNui';

interface TarkovGridItemProps {
  item: SlotWithItem;
  w: number;
  h: number;
  inventoryType: Inventory['type'];
  inventoryGroups: Inventory['groups'];
  inventoryId: Inventory['id'];
  searchState?: Inventory['searchState'];
}

const TarkovGridItem: React.FC<TarkovGridItemProps> = ({
  item,
  w,
  h,
  inventoryType,
  inventoryGroups,
  inventoryId,
  searchState,
}) => {
  const dispatch = useAppDispatch();
  const manager = useDragDropManager();
  const timerRef = useRef<number | null>(null);

  // Search mechanic state
  const isSearchRequired = !!searchState; // searchState exists means this inventory requires searching
  const isSearched = isSearchRequired ? !!searchState?.[String(item.slot)] : true;
  const [searchProgress, setSearchProgress] = useState(0);
  const [isSearching, setIsSearching] = useState(false);
  const searchIntervalRef = useRef<number | null>(null);
  const searchStartRef = useRef<number>(0);

  // Clean up search interval on unmount
  useEffect(() => {
    return () => {
      if (searchIntervalRef.current) {
        clearInterval(searchIntervalRef.current);
        searchIntervalRef.current = null;
      }
    };
  }, []);

  const startSearch = useCallback(() => {
    if (isSearched || isSearching || !isSearchRequired) return;

    setIsSearching(true);
    searchStartRef.current = Date.now();
    setSearchProgress(0);

    searchIntervalRef.current = window.setInterval(() => {
      const elapsed = Date.now() - searchStartRef.current;
      const progress = Math.min((elapsed / SEARCH_DURATION_MS) * 100, 100);
      setSearchProgress(progress);

      if (progress >= 100) {
        if (searchIntervalRef.current) {
          clearInterval(searchIntervalRef.current);
          searchIntervalRef.current = null;
        }
        setIsSearching(false);
        setSearchProgress(100);

        // Tell the server this slot was searched
        fetchNui('searchSlot', { slot: item.slot }).then((success) => {
          if (success) {
            dispatch(markSlotSearched({
              inventoryId,
              slot: item.slot,
              name: item.name,
            }));
          }
        });
      }
    }, 30);
  }, [isSearched, isSearching, isSearchRequired, item.slot, item.name, inventoryId, dispatch]);

  const cancelSearch = useCallback(() => {
    if (searchIntervalRef.current) {
      clearInterval(searchIntervalRef.current);
      searchIntervalRef.current = null;
    }
    setIsSearching(false);
    setSearchProgress(0);
  }, []);

  const canDrag = useCallback(() => {
    // Block dragging unsearched items
    if (isSearchRequired && !isSearched) return false;
    return canPurchaseItem(item, { type: inventoryType, groups: inventoryGroups }) && canCraftItem(item, inventoryType);
  }, [item, inventoryType, inventoryGroups, isSearchRequired, isSearched]);

  const [{ isDragging }, drag] = useDrag<DragSource, void, { isDragging: boolean }>(
    () => ({
      type: 'SLOT',
      collect: (monitor) => ({
        isDragging: monitor.isDragging(),
      }),
      item: () => {
        if (isSlotWithItem(item, inventoryType !== InventoryType.SHOP)) {
          const initialRotated = item.rotated ?? false;
          dispatch(setDragRotated(initialRotated));

          const baseSize = getItemSize(item.name);

          return {
            inventory: inventoryType,
            item: {
              name: item.name,
              slot: item.slot,
            },
            image: item?.name ? `url(${getItemUrl(item) || 'none'})` : undefined,
            sizeX: baseSize.sizeX,
            sizeY: baseSize.sizeY,
            rotated: initialRotated,
            gridX: item.gridX ?? 0,
            gridY: item.gridY ?? 0,
          };
        }
        return null;
      },
      canDrag,
    }),
    [inventoryType, item, w, h, canDrag]
  );

  useNuiEvent('refreshSlots', (data: { items?: ItemsPayload | ItemsPayload[] }) => {
    if (!isDragging && !data.items) return;
    if (!Array.isArray(data.items)) return;

    const itemSlot = data.items.find(
      (dataItem) => dataItem.item.slot === item.slot && dataItem.inventory === inventoryId
    );

    if (!itemSlot) return;

    manager.dispatch({ type: 'dnd-core/END_DRAG' });
  });

  const handleContext = (event: React.MouseEvent<HTMLDivElement>) => {
    event.preventDefault();
    if (inventoryType !== 'player' || !isSlotWithItem(item)) return;
    dispatch(openContextMenu({ item, coords: { x: event.clientX, y: event.clientY } }));
  };

  const handleClick = (event: React.MouseEvent<HTMLDivElement>) => {
    dispatch(closeTooltip());
    if (timerRef.current) clearTimeout(timerRef.current);
    if (isSearchRequired && !isSearched) return; // Block clicks on unsearched items
    if (event.ctrlKey && isSlotWithItem(item) && inventoryType !== 'shop' && inventoryType !== 'crafting') {
      onDrop({ item: item, inventory: inventoryType, sizeX: w, sizeY: h, rotated: item.rotated ?? false, gridX: item.gridX ?? 0, gridY: item.gridY ?? 0 });
    } else if (event.altKey && isSlotWithItem(item) && inventoryType === 'player') {
      onUse(item);
    }
  };

  const itemUrl = getItemUrl(item);

  // Determine visual state
  const isHidden = isSearchRequired && !isSearched;

  return (
    <div
      ref={(el) => { drag(el); }}
      className={`tarkov-grid-item ${isHidden ? 'item-unsearched' : ''}`}
      onContextMenu={handleContext}
      onClick={handleClick}
      style={{
        gridColumn: `${(item.gridX ?? 0) + 1} / span ${w}`,
        gridRow: `${(item.gridY ?? 0) + 1} / span ${h}`,
        opacity: isDragging ? 0.3 : 1,
        cursor: isHidden ? 'default' : undefined,
      }}
      onMouseEnter={() => {
        if (isHidden) {
          startSearch();
          return;
        }
        timerRef.current = window.setTimeout(() => {
          dispatch(openTooltip({ item, inventoryType }));
        }, 500) as unknown as number;
      }}
      onMouseLeave={() => {
        if (isHidden) {
          cancelSearch();
          return;
        }
        dispatch(closeTooltip());
        if (timerRef.current) {
          clearTimeout(timerRef.current);
          timerRef.current = null;
        }
      }}
    >
      {/* Inner wrapper that receives blur when unsearched */}
      <div
        className="tarkov-item-inner"
        style={{
          position: 'absolute',
          inset: 0,
          filter: isHidden
            ? 'blur(8px) brightness(40%)'
            : !canPurchaseItem(item, { type: inventoryType, groups: inventoryGroups }) || !canCraftItem(item, inventoryType)
              ? 'brightness(80%) grayscale(100%)'
              : undefined,
        }}
      >
        <div
          className="tarkov-item-image"
          style={{
            position: 'absolute',
            top: '50%',
            left: '50%',
            width: item.rotated ? `${(h / w) * 100}%` : '100%',
            height: item.rotated ? `${(w / h) * 100}%` : '100%',
            transform: `translate(-50%, -50%)${item.rotated ? ' rotate(90deg)' : ''}`,
            backgroundImage: itemUrl ? `url(${itemUrl})` : 'none',
            backgroundSize: 'contain',
            backgroundPosition: 'center',
            backgroundRepeat: 'no-repeat',
            zIndex: 1,
          }}
        />
        <div className="tarkov-item-content" style={{ position: 'relative', zIndex: 2 }}>
          <div className="tarkov-item-header">
            <div className="tarkov-item-info">
              {!isHidden && item.count > 1 && <p>{item.count.toLocaleString('en-us')}x</p>}
            </div>
          </div>
          <div className="tarkov-item-footer">
            {!isHidden && inventoryType !== 'shop' && item?.durability !== undefined && (
              <div
                className={`durability-bar-container ${item.rotated ? 'rotated' : ''}`}
                style={
                  item.rotated
                    ? {
                        transform: 'rotate(-90deg)',
                        transformOrigin: 'left bottom',
                        position: 'absolute',
                        left: '2px',
                        bottom: '2px',
                        width: `calc(${h} * 5vh - 4px)`,
                        zIndex: 10,
                      }
                    : undefined
                }
              >
                <WeightBar percent={item.durability} durability />
              </div>
            )}
            {!isHidden && inventoryType === 'shop' && item?.price !== undefined && (
              <>
                {item?.currency !== 'money' && item.currency !== 'black_money' && item.price > 0 && item.currency ? (
                  <div className="item-slot-currency-wrapper">
                    <img
                      src={item.currency ? getItemUrl(item.currency) : 'none'}
                      alt="item-image"
                      style={{
                        imageRendering: '-webkit-optimize-contrast',
                        height: 'auto',
                        width: '2vh',
                        backfaceVisibility: 'hidden',
                        transform: 'translateZ(0)',
                      }}
                    />
                    <p>{item.price.toLocaleString('en-us')}</p>
                  </div>
                ) : (
                  <>
                    {item.price > 0 && (
                      <div
                        className="item-slot-price-wrapper"
                        style={{ color: item.currency === 'money' || !item.currency ? '#2ECC71' : '#E74C3C' }}
                      >
                        <p>
                          {Locale.$ || '$'}
                          {item.price.toLocaleString('en-us')}
                        </p>
                      </div>
                    )}
                  </>
                )}
              </>
            )}
            <div className="inventory-slot-label-box">
              <div className="inventory-slot-label-text">
                {isHidden ? '???' : (item.metadata?.label ? item.metadata.label : Items[item.name]?.label || item.name)}
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* Search overlay — sits OUTSIDE the blurred wrapper so it stays crisp */}
      {isHidden && isSearching && (
        <div className="search-progress-container">
          <div className="search-progress-bar" style={{ width: `${searchProgress}%` }} />
        </div>
      )}
      {isHidden && !isSearching && (
        <div className="item-unsearched-label">
          <span>?</span>
        </div>
      )}
    </div>
  );
};

export default React.memo(TarkovGridItem);
