export let searchDuration = 2000;

export function setSearchDuration(ms: number) {
  if (typeof ms === 'number' && ms > 0) searchDuration = ms;
}
