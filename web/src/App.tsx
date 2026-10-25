import InventoryComponent from './components/inventory';
import useNuiEvent from './hooks/useNuiEvent';
import { Items } from './store/items';
import { Locale } from './store/locale';
import { setImagePath } from './store/imagepath';
import { setSearchDuration } from './store/searchDuration';
import { setupInventory, setDragRotated } from './store/inventory';
import { Inventory } from './typings';
import { useAppDispatch } from './store';
import { debugData } from './utils/debugData';
import DragPreview from './components/utils/DragPreview';
import { fetchNui } from './utils/fetchNui';
import { useDragDropManager } from 'react-dnd';
import KeyPress from './components/utils/KeyPress';

debugData([
  {
    action: 'setupInventory',
    data: {
      leftInventory: {
        id: 'test',
        type: 'player',
        slots: 50,
        gridWidth: 7,
        gridHeight: 7,
        label: 'Bob Smith',
        weight: 3000,
        maxWeight: 5000,
        items: [
          {
            slot: 1,
            name: 'iron',
            weight: 3000,
            gridX: 0,
            gridY: 0,
            rotated: false,
            metadata: {
              description: `name: Svetozar Miletic  \n Gender: Male`,
              ammo: 3,
              mustard: '60%',
              ketchup: '30%',
              mayo: '10%',
            },
            count: 5,
          },
          { slot: 2, name: 'powersaw', weight: 0, count: 1, gridX: 1, gridY: 0, rotated: false, metadata: { durability: 75 } },
          { slot: 3, name: 'copper', weight: 100, count: 12, gridX: 3, gridY: 0, rotated: false, metadata: { type: 'Special' } },
          {
            slot: 4,
            name: 'water',
            weight: 100,
            count: 1,
            gridX: 0,
            gridY: 1,
            rotated: false,
            metadata: { description: 'Generic item description' },
          },
          { slot: 5, name: 'water', weight: 100, count: 1, gridX: 1, gridY: 1, rotated: false },
          {
            slot: 6,
            name: 'backwoods',
            weight: 100,
            count: 1,
            gridX: 2,
            gridY: 1,
            rotated: false,
            metadata: {
              label: 'Russian Cream',
              imageurl: 'https://i.imgur.com/2xHhTTz.png',
            },
          },
        ],
      },
      rightInventory: {
        id: 'shop',
        type: 'otherplayer',
        slots: 50,
        gridWidth: 7,
        gridHeight: 7,
        label: 'Target Player',
        weight: 3000,
        maxWeight: 5000,
        searchState: {},
        items: [
          {
            slot: 1,
            name: 'lockpick',
            weight: 500,
            gridX: 0,
            gridY: 0,
            rotated: false,
            metadata: {
              description: 'Simple lockpick that breaks easily and can pick basic door locks',
            },
          },
        ],
      },
    },
  },
]);

const App: React.FC = () => {
  const dispatch = useAppDispatch();
  const manager = useDragDropManager();

  useNuiEvent<{
    locale: { [key: string]: string };
    items: typeof Items;
    leftInventory: Inventory;
    imagepath: string;
    searchDuration: number;
  }>('init', ({ locale, items, leftInventory, imagepath, searchDuration }) => {
    for (const name in locale) Locale[name] = locale[name];
    for (const name in items) Items[name] = items[name];

    setImagePath(imagepath);
    setSearchDuration(searchDuration);
    dispatch(setupInventory({ leftInventory }));
  });

  fetchNui('uiLoaded', {});

  useNuiEvent('closeInventory', () => {
    manager.dispatch({ type: 'dnd-core/END_DRAG' });
    dispatch(setDragRotated(false));
  });

  return (
    <div className="app-wrapper">
      <InventoryComponent />
      <DragPreview />
      <KeyPress />
    </div>
  );
};

addEventListener('dragstart', function (event) {
  event.preventDefault();
});

export default App;
