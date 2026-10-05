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

export function setupScrollParallax(onScrolled) {
  const reducedMotion = window.matchMedia("(prefers-reduced-motion: reduce)").matches;
  if (reducedMotion) return;

  let ticking = false;

  const emit = () => {
    ticking = false;
    const doc = document.documentElement;
    const max = Math.max(1, doc.scrollHeight - window.innerHeight);
    const progress = Math.min(1, Math.max(0, (window.scrollY || doc.scrollTop) / max));
    onScrolled(progress);
  };

  const onScroll = () => {
    if (ticking) return;
    ticking = true;
    requestAnimationFrame(emit);
  };

  window.addEventListener("scroll", onScroll, { passive: true });
  window.addEventListener("resize", onScroll, { passive: true });
  emit();
}

let escapeHandler = null;

export function bindEscape(onEscape) {
  unbindEscape();

  escapeHandler = (e) => {
    if (e.key !== "Escape" || e.repeat) return;
    e.preventDefault();
    onEscape();
  };

  document.addEventListener("keydown", escapeHandler);
}

export function unbindEscape() {
  if (!escapeHandler) return;
  document.removeEventListener("keydown", escapeHandler);
  escapeHandler = null;
}
