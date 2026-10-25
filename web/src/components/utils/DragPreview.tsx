import React, { RefObject, useRef } from 'react';
import { DragLayerMonitor, useDragLayer, XYCoord } from 'react-dnd';
import { DragSource } from '../../typings';
import { useAppSelector } from '../../store';
import { selectDragRotated } from '../../store/inventory';

interface DragLayerProps {
  data: DragSource;
  currentOffset: XYCoord | null;
  isDragging: boolean;
  clientOffset: XYCoord | null;
}

const CELL_SIZE_VH = 5;

const subtract = (a: XYCoord, b: XYCoord): XYCoord => {
  return {
    x: a.x - b.x,
    y: a.y - b.y,
  };
};

const calculateParentOffset = (monitor: DragLayerMonitor): XYCoord => {
  const client = monitor.getInitialClientOffset();
  const source = monitor.getInitialSourceClientOffset();
  if (client === null || source === null || client.x === undefined || client.y === undefined) {
    return { x: 0, y: 0 };
  }
  return subtract(client, source);
};

export const calculatePointerPosition = (
  monitor: DragLayerMonitor,
  childRef: RefObject<Element | null>
): XYCoord | null => {
  const offset = monitor.getClientOffset();
  if (offset === null) {
    return null;
  }

  if (!childRef.current || !childRef.current.getBoundingClientRect) {
    return subtract(offset, calculateParentOffset(monitor));
  }

  const bb = childRef.current.getBoundingClientRect();
  const middle = { x: bb.width / 2, y: bb.height / 2 };
  return subtract(offset, middle);
};

function isMouseOverHotbar(clientOffset: XYCoord | null): boolean {
  if (!clientOffset) return false;
  const el = document.querySelector('.player-hotbar-container');
  if (!el) return false;
  const rect = el.getBoundingClientRect();
  return (
    clientOffset.x >= rect.left &&
    clientOffset.x <= rect.right &&
    clientOffset.y >= rect.top &&
    clientOffset.y <= rect.bottom
  );
}

const DragPreview: React.FC = () => {
  const element = useRef<HTMLDivElement>(null);
  const dragRotated = useAppSelector(selectDragRotated);

  const { data, isDragging, currentOffset, clientOffset } = useDragLayer<DragLayerProps>((monitor) => ({
    data: monitor.getItem(),
    currentOffset: calculatePointerPosition(monitor, element),
    isDragging: monitor.isDragging(),
    clientOffset: monitor.getClientOffset(),
  }));

  if (!isDragging || !currentOffset || !data?.item) return null;

  const overHotbar = isMouseOverHotbar(clientOffset);

  // Calculate size based on item dimensions, accounting for rotation
  const cellSize = (window.innerHeight * CELL_SIZE_VH) / 100;
  let previewW: number;
  let previewH: number;

  if (data.sizeX && data.sizeY) {
    if (dragRotated) {
      // Rotated: swap dimensions
      previewW = data.sizeY * cellSize;
      previewH = data.sizeX * cellSize;
    } else {
      previewW = data.sizeX * cellSize;
      previewH = data.sizeY * cellSize;
    }
  } else {
    previewW = cellSize;
    previewH = cellSize;
  }

  // Shrink to a small square when over a hotbar slot
  const scale = overHotbar ? Math.min(cellSize / previewW, cellSize / previewH) : 1;

  return (
    <div
      className="item-drag-preview"
      ref={element}
      style={{
        transform: `translate(${currentOffset.x}px, ${currentOffset.y}px)`,
        width: `${previewW}px`,
        height: `${previewH}px`,
        pointerEvents: 'none',
      }}
    >
      <div
        className="item-drag-preview-inner"
        style={{
          width: '100%',
          height: '100%',
          transform: `scale(${scale})`,
          transition: 'transform 0.18s cubic-bezier(0.25, 1, 0.5, 1)',
          position: 'relative',
        }}
      >
        <div
          style={{
            position: 'absolute',
            top: '50%',
            left: '50%',
            width: dragRotated ? `calc(${previewH}px - 8px)` : 'calc(100% - 8px)',
            height: dragRotated ? `calc(${previewW}px - 8px)` : 'calc(100% - 8px)',
            transform: `translate(-50%, -50%)${dragRotated ? ' rotate(90deg)' : ''}`,
            backgroundImage: data.image,
            backgroundSize: 'contain',
            backgroundPosition: 'center',
            backgroundRepeat: 'no-repeat',
          }}
        />
      </div>
    </div>
  );
};

export default DragPreview;

