import { ItemData } from '../typings/item';

export const Items: {
  [key: string]: ItemData | undefined;
} = {
  water: {
    name: 'water',
    close: false,
    label: 'WATER',
    stack: true,
    usable: true,
    count: 0,
    sizeX: 1,
    sizeY: 1,
  },
  burger: {
    name: 'burger',
    close: false,
    label: 'BURGER',
    stack: false,
    usable: false,
    count: 0,
    sizeX: 1,
    sizeY: 1,
  },
};
