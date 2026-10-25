// Simple shared mutable state for drag preview sizing.
// When dragging over a hotbar slot, the preview should shrink.
let _overHotbar = false;

export function setOverHotbar(value: boolean) {
  _overHotbar = value;
}

export function isOverHotbar(): boolean {
  return _overHotbar;
}
