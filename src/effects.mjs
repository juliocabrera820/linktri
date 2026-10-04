export function setupCursorEffect(onLoaded, onMouseMoved) {
  setTimeout(onLoaded, 120);

  const isTouchDevice = window.matchMedia("(hover: none), (pointer: coarse)").matches;
  const reducedMotion = window.matchMedia("(prefers-reduced-motion: reduce)").matches;
  if (isTouchDevice || reducedMotion) return;

  window.addEventListener("mousemove", (e) => {
    const normX = e.clientX / (window.innerWidth || 1);
    const normY = e.clientY / (window.innerHeight || 1);
    onMouseMoved(normX, normY);
  });
}
