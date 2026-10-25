import InventoryGrid from './InventoryGrid';
import { useAppSelector } from '../../store';
import { selectRightInventory } from '../../store/inventory';

const RightInventory: React.FC = () => {
  const rightInventory = useAppSelector(selectRightInventory);

  if (!rightInventory || !rightInventory.id || rightInventory.slots === 0) {
    return null;
  }

  const isDrop = rightInventory.type === 'drop' || rightInventory.type === 'newdrop';
  if (isDrop) {
    const hasItems = rightInventory.items.some((item) => item && item.name);
    if (!hasItems) {
      return null;
    }
  }

  return <InventoryGrid inventory={rightInventory} />;
};

export default RightInventory;
