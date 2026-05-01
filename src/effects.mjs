export function setupCursorEffect(onLoaded, onMouseMoved) {
  setTimeout(onLoaded, 120);

  const el = () => document.getElementById("cursor");

  window.addEventListener("mousemove", (e) => {
    const c = el();
    if (c) {
      c.style.left = e.clientX + "px";
      c.style.top = e.clientY + "px";
    }
    const normX = e.clientX / (window.innerWidth || 1);
    const normY = e.clientY / (window.innerHeight || 1);
    onMouseMoved(normX, normY);
  });

  document.addEventListener("mouseover", (e) => {
    if (!e.target.closest("a")) return;
    const c = el();
    if (!c) return;
    c.style.width = "36px";
    c.style.height = "36px";
    c.style.opacity = "0.35";
  });

  document.addEventListener("mouseout", (e) => {
    const link = e.target.closest("a");
    if (!link || link.contains(e.relatedTarget)) return;
    const c = el();
    if (!c) return;
    c.style.width = "";
    c.style.height = "";
    c.style.opacity = "";
  });
}
