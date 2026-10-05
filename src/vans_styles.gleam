pub fn vans_styles() -> String {
  "@import url('https://fonts.googleapis.com/css2?family=Almarai:wght@400;700;800&family=Instrument+Serif:ital@0;1&display=swap');

  *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

  /* Design tokens — Dark Charcoal Theme (warm brown accents) */
  :root {
    color-scheme: dark;

    /* Raw RGB channels so translucent variants stay in sync with the palette */
    --bg-rgb:      17,18,20;
    --p-rgb:       236,237,239;
    --accent-rgb:  204,148,104;
    --sand-rgb:    226,196,166;

    --bg:          rgb(var(--bg-rgb));
    --bg-card:     #1C1E22;
    --bg-surface:  #25282D;
    --primary:     rgb(var(--p-rgb));
    --primary-hover: var(--accent);
    --on-primary:  rgb(var(--bg-rgb));
    --accent:      rgb(var(--accent-rgb));
    --sand:        rgb(var(--sand-rgb));
    --p70:  rgba(var(--p-rgb),.70);
    --p40:  rgba(var(--p-rgb),.40);
    --p20:  rgba(var(--p-rgb),.20);
    --p12:  rgba(var(--p-rgb),.12);
    --p08:  rgba(var(--p-rgb),.08);
    --p06:  rgba(var(--p-rgb),.06);
    --p04:  rgba(var(--p-rgb),.04);
    --gray-mid:    #9AA0A8;

    --sans:  'Almarai', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
    --serif: 'Instrument Serif', Georgia, serif;

    --ease-out:    cubic-bezier(0.16, 1, 0.3, 1);
    --ease-io:     cubic-bezier(0.4, 0, 0.2, 1);
    --spring:      cubic-bezier(0.34, 1.56, 0.64, 1);
  }

  html { overflow-x: hidden; }

  html, body {
    width: 100%; height: 100%;
    background: var(--bg);
    font-family: var(--sans);
    color: var(--primary);
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
  }

  a { color: inherit; text-decoration: none; }
  /* Native OS cursor everywhere (respects the user's cursor size/contrast settings). */
  a[href], button, [role='button'], .link-item { cursor: pointer; }
  img { display: block; max-width: 100%; }

  /* Baseline keyboard focus ring. Zero specificity via :where(). */
  :where(a, button, [tabindex]):focus-visible {
    outline: 2px solid var(--primary);
    outline-offset: 3px;
    border-radius: 3px;
  }

  ::-webkit-scrollbar { width: 3px; }
  ::-webkit-scrollbar-track { background: var(--bg); }
  ::-webkit-scrollbar-thumb { background: var(--p20); border-radius: 3px; }

  ::selection { background: rgba(var(--accent-rgb),.22); color: var(--primary); }

  .checker-tl, .checker-br {
    position: fixed;
    width: 72px; height: 72px;
    pointer-events: none;
    z-index: 10;
    color: var(--primary);
  }
  .checker-tl { top: 0; left: 0; }
  .checker-br { bottom: 0; right: 0; }

  .geo-bar {
    position: absolute;
    background: var(--bg-card);
  }

  .marquee-wrap {
    position: fixed;
    bottom: 0; left: 0; right: 0;
    height: 36px;
    background: var(--accent);
    overflow: hidden;
    z-index: 100;
    display: flex;
    align-items: center;
  }
  .marquee-track {
    display: flex;
    white-space: nowrap;
    animation: marquee 22s linear infinite;
    gap: 0;
    will-change: transform;
  }
  .marquee-track span {
    font-family: var(--sans);
    font-weight: 700;
    font-size: 12px;
    letter-spacing: 0.18em;
    text-transform: uppercase;
    color: var(--on-primary);
    padding: 0 32px;
  }
  .marquee-track .dot {
    color: var(--on-primary);
    opacity: 0.5;
    padding: 0;
  }
  @keyframes marquee {
    from { transform: translateX(0); }
    to   { transform: translateX(-50%); }
  }

  .side-label {
    position: fixed;
    left: 24px;
    top: 50%;
    transform: translateY(-50%) rotate(-90deg);
    transform-origin: center center;
    font-family: var(--sans);
    font-weight: 700;
    font-size: 11px;
    letter-spacing: 0.25em;
    color: var(--gray-mid);
    white-space: nowrap;
    pointer-events: none;
    z-index: 10;
  }
  @media (max-width: 768px) {
    .side-label { display: none; }
  }

  .page {
    min-height: 100vh;
    min-height: 100svh;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 60px 24px 72px;
    position: relative;
    overflow: hidden;
  }

  .parallax-bg {
    --plx-x: 0px;
    --plx-y: 0px;
    --plx-s: 0px;
    position: absolute;
    inset: -60px;
    pointer-events: none;
    z-index: 0;
  }
  .plax-layer {
    position: absolute;
    inset: 0;
    will-change: transform;
    transition: transform 0.3s cubic-bezier(0.23, 1, 0.32, 1);
  }
  .plax-layer--far {
    z-index: 2;
    transform: translate3d(
      calc(var(--plx-x) * 0.4),
      calc(var(--plx-y) * 0.4 + var(--plx-s) * 0.45),
      0
    );
  }
  .plax-layer--mid {
    z-index: 1;
    transform: translate3d(
      calc(var(--plx-x) * 0.7),
      calc(var(--plx-y) * 0.7 + var(--plx-s) * 0.2),
      0
    );
  }
  .plax-layer--near {
    z-index: 3;
    transform: translate3d(
      calc(var(--plx-x) * 1.3),
      calc(var(--plx-y) * 1.3 - var(--plx-s) * 0.25),
      0
    );
  }

  .blob {
    position: absolute;
    border-radius: 50%;
    background: radial-gradient(circle, rgba(var(--accent-rgb), .10) 0%, var(--bg-surface) 70%);
    opacity: 0.35;
  }
  .blob--a { width: 320px; height: 320px; top: 10%; right: 8%; }
  .blob--b { width: 180px; height: 180px; bottom: 18%; left: 6%; opacity: 0.4; }
  .blob--c { width: 80px; height: 80px; top: 38%; left: 16%; opacity: 0.3; }

  .bg-word {
    position: absolute;
    font-family: var(--sans);
    font-weight: 800;
    letter-spacing: -0.05em;
    color: transparent;
    -webkit-text-stroke: 1px var(--p06);
    white-space: nowrap;
    pointer-events: none;
    user-select: none;
    line-height: 1;
  }
  .bg-word--off { font-size: clamp(80px, 14vw, 160px); top: 5%; right: -2%; }
  .bg-word--wall { font-size: clamp(80px, 14vw, 160px); bottom: 28%; right: -3%; }
  .bg-word--since { font-size: clamp(40px, 6vw, 80px); bottom: 10%; left: 2%; letter-spacing: 0.18em; }

  .bg-strip {
    position: absolute;
    height: 14px;
    background-image: repeating-conic-gradient(var(--p06) 0% 25%, transparent 0% 50%);
    background-size: 16px 16px;
    pointer-events: none;
    opacity: 0.9;
  }
  .bg-strip--a { width: 45%; top: 48%; right: 0; }
  .bg-strip--b { width: 30%; top: 65%; left: 0; }

  .geo-bar--a { width: 120px; height: 9px; top: 22%; left: 10%; opacity: 0.5; }
  .geo-bar--b { width: 60px; height: 9px; top: 28%; right: 18%; opacity: 0.4; }
  .geo-bar--c { width: 180px; height: 9px; bottom: 22%; right: 10%; opacity: 0.35; }

  .bg-deco {
    position: absolute;
    pointer-events: none;
    color: var(--primary);
  }
  .bg-deck--a { width: 44px; height: 96px; bottom: 14%; right: 7%; opacity: 0.07; transform: rotate(30deg); }
  .bg-deck--b { width: 32px; height: 70px; top: 6%; left: 7%; opacity: 0.06; transform: rotate(-18deg); }
  .bg-plus--a { width: 36px; height: 36px; top: 62%; right: 18%; opacity: 0.1; }
  .bg-plus--b { width: 22px; height: 22px; top: 18%; right: 5%; opacity: 0.07; }

  @media (max-width: 768px) {
    .bg-strip, .geo-bar, .bg-deck { display: none; }
    .bg-word { -webkit-text-stroke-color: var(--p04); }

    .blob--a { width: 250px; height: 250px; top: -70px; right: -70px; opacity: 0.28; }
    .blob--b { width: 190px; height: 190px; bottom: -60px; left: -70px; opacity: 0.28; }
    .blob--c { display: none; }

    .bg-word--off { font-size: clamp(52px, 17vw, 76px); top: 72px; right: 46px; }
    .bg-word--wall { font-size: clamp(52px, 17vw, 76px); bottom: 34%; right: 34px; }
    .bg-word--since { font-size: clamp(30px, 9vw, 46px); bottom: 30%; left: 46px; }

    .bg-plus--a { top: 50%; right: 58px; }
    .bg-plus--b { top: 14%; right: 62px; }
  }
  @media (max-width: 560px) {
    .bg-plus { display: none; }
    .bg-word--since { bottom: 9%; left: 40px; }
  }

  .card {
    position: relative;
    z-index: 2;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 0;
    width: 100%;
    max-width: 520px;
  }

  .avatar-wrap {
    position: relative;
    margin-bottom: 28px;
    opacity: 0;
    transform: translateY(24px);
    transition: opacity 0.7s var(--ease-out) 0.1s, transform 0.7s var(--ease-out) 0.1s;
  }
  .avatar-wrap.visible {
    opacity: 1;
    transform: translateY(0);
  }
  .avatar-ring {
    width: 96px; height: 96px;
    border-radius: 50%;
    border: 2px solid var(--accent);
    display: flex; align-items: center; justify-content: center;
    background: var(--bg-surface);
    position: relative;
    overflow: hidden;
  }
  .avatar-placeholder {
    width: 100%; height: 100%;
    object-fit: cover;
    background: var(--bg-surface);
  }
  .avatar-badge {
    position: absolute;
    bottom: -4px; right: -4px;
    width: 28px; height: 28px;
    background: var(--accent);
    color: var(--on-primary);
    border-radius: 50%;
    border: 2px solid var(--bg);
    display: flex; align-items: center; justify-content: center;
  }
  .avatar-badge svg { width: 12px; height: 12px; }

  .name-block {
    text-align: center;
    margin-bottom: 8px;
    opacity: 0;
    transform: translateY(20px);
    transition: opacity 0.7s var(--ease-out) 0.25s, transform 0.7s var(--ease-out) 0.25s;
  }
  .name-block.visible { opacity: 1; transform: translateY(0); }
  .name {
    font-family: var(--sans);
    font-weight: 800;
    font-size: clamp(42px, 8vw, 72px);
    line-height: .9;
    letter-spacing: -0.055em;
    color: var(--primary);
  }
  .name-accent {
    font-family: var(--serif);
    font-style: italic;
    font-weight: 400;
    letter-spacing: -0.02em;
    color: var(--accent);
    padding-left: .04em;
  }

  .otw-tag {
    display: inline-block;
    margin-top: 12px;
    font-family: var(--sans);
    font-weight: 700;
    font-size: 11px;
    letter-spacing: 0.15em;
    color: var(--on-primary);
    background: var(--accent);
    padding: 5px 12px;
    border-radius: 100px;
    text-transform: uppercase;
  }

  .tagline {
    margin-top: 12px;
    font-size: 13px;
    color: var(--p70);
    letter-spacing: 0.04em;
    line-height: 1.7;
    text-align: center;
    max-width: 360px;
  }

  .divider {
    width: 100%;
    height: 1px;
    background: linear-gradient(90deg, transparent, var(--p12) 20%, var(--p12) 80%, transparent);
    margin: 24px 0 20px;
  }

  .section-label {
    font-family: var(--sans);
    font-weight: 700;
    font-size: 12px;
    letter-spacing: 0.15em;
    color: var(--p70);
    text-transform: uppercase;
    align-self: flex-start;
    margin-bottom: 8px;
    opacity: 0;
    transform: translateX(-12px);
    transition: opacity 0.5s var(--ease-out), transform 0.5s var(--ease-out);
  }
  .section-label.visible { opacity: 1; transform: translateX(0); }

  .links-group {
    width: 100%;
    display: flex;
    flex-direction: column;
    gap: 0;
    margin-bottom: 8px;
  }

  .link-item {
    position: relative;
    display: flex;
    align-items: center;
    gap: 14px;
    padding: 13px 12px;
    border-radius: 12px;
    border-bottom: 1px solid var(--p08);
    text-decoration: none;
    color: var(--primary);
    overflow: hidden;
    opacity: 0;
    transform: translateX(-20px);
    transition: opacity 0.5s var(--ease-out), transform 0.5s var(--ease-out),
                background 0.25s ease, border-color 0.25s ease;
  }
  .link-item.visible {
    opacity: 1;
    transform: translateX(0);
  }
  .link-item::before {
    content: '';
    position: absolute;
    inset: 0;
    background: var(--bg-card);
    border-radius: 12px;
    opacity: 0;
    transition: opacity 0.25s ease;
    z-index: 0;
  }
  .link-item::after {
    content: '';
    position: absolute;
    left: 0; top: 10px; bottom: 10px;
    width: 3px;
    background: var(--accent);
    border-radius: 0 2px 2px 0;
    transform: scaleY(0);
    transform-origin: center;
    transition: transform 0.35s var(--spring);
    z-index: 2;
  }

  .link-icon {
    position: relative;
    z-index: 1;
    width: 36px; height: 36px;
    border-radius: 10px;
    background: var(--p08);
    border: 1px solid var(--p08);
    color: var(--primary);
    display: flex; align-items: center; justify-content: center;
    flex-shrink: 0;
    transition: background 0.2s ease, border-color 0.2s ease, color 0.2s ease,
                transform 0.4s var(--spring);
  }
  .link-icon svg { width: 16px; height: 16px; }

  .link-info {
    position: relative;
    z-index: 1;
    flex: 1;
    display: flex;
    flex-direction: column;
    gap: 2px;
    transition: transform 0.35s var(--spring);
  }

  .link-label {
    font-size: 15px;
    font-weight: 700;
    letter-spacing: -0.01em;
    transition: color 0.2s ease;
  }
  .link-sub {
    font-size: 12px;
    color: var(--gray-mid);
    letter-spacing: 0.03em;
  }

  .link-arrow {
    position: relative;
    z-index: 1;
    display: flex; align-items: center; justify-content: center;
    width: 30px; height: 30px;
    border: 1px solid var(--p12);
    border-radius: 50%;
    opacity: 0;
    transform: translateX(-6px);
    transition: opacity 0.25s ease, transform 0.35s var(--spring),
                border-color 0.3s ease, background 0.3s ease;
    color: var(--primary);
  }
  .link-arrow svg { width: 14px; height: 14px; }

  .link-item.in-progress::after {
    background: linear-gradient(180deg, var(--accent), var(--sand));
  }
  .link-item.in-progress .link-sub::after {
    content: ' • In progress';
    color: var(--accent);
    font-size: 10px;
    font-weight: 700;
    letter-spacing: 0.1em;
    text-transform: uppercase;
  }

  @media (hover: hover) {
    .link-item:hover::before { opacity: 1; }
    .link-item:hover::after  { transform: scaleY(1); }
    .link-item:hover .link-label { color: var(--accent); }
    .link-item:hover .link-info { transform: translateX(5px); }
    .link-item:hover .link-icon {
      background: var(--primary);
      border-color: var(--primary);
      color: var(--on-primary);
      transform: scale(1.1);
    }
    .link-item:hover .link-arrow {
      opacity: 1;
      transform: translateX(0) rotate(-45deg);
      border-color: var(--p40);
      background: var(--p08);
    }
    .link-item.in-progress:hover .link-icon {
      background: linear-gradient(135deg, var(--accent), var(--sand));
      border-color: var(--accent);
    }
  }
  .link-item:focus-visible { outline-offset: 0; border-radius: 12px; }
  .link-item:focus-visible .link-arrow { opacity: 1; transform: translateX(0); }

  .venture-badge {
    display: inline-block;
    padding: 2px 8px;
    background: linear-gradient(135deg, var(--accent), var(--sand));
    color: var(--on-primary);
    font-size: 10px;
    font-weight: 700;
    letter-spacing: 0.12em;
    text-transform: uppercase;
    border-radius: 100px;
    margin-left: 8px;
    animation: pulse-glow 2s ease-in-out infinite;
  }
  @keyframes pulse-glow {
    0%, 100% { box-shadow: 0 0 0 0 rgba(var(--accent-rgb), 0.4); }
    50% { box-shadow: 0 0 0 6px rgba(var(--accent-rgb), 0); }
  }

  .footer-tag {
    margin-top: 28px;
    font-family: var(--sans);
    font-weight: 700;
    font-size: 11px;
    letter-spacing: 0.2em;
    color: var(--gray-mid);
    opacity: 0;
    transition: opacity 0.7s ease 1.2s;
  }
  .footer-tag.visible { opacity: 1; }

  .popup-overlay {
    position: fixed;
    inset: 0;
    background: rgba(var(--bg-rgb), .72);
    backdrop-filter: blur(6px);
    -webkit-backdrop-filter: blur(6px);
    z-index: 1000;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 24px;
    cursor: pointer;
    animation: fade-in 0.25s ease;
  }
  @keyframes fade-in {
    from { opacity: 0; }
    to { opacity: 1; }
  }
  .popup-content {
    background: var(--bg-card);
    border: 1px solid var(--p12);
    border-radius: 1.5rem;
    padding: 36px 40px 32px;
    width: 100%;
    max-width: 400px;
    text-align: center;
    cursor: default;
    box-shadow:
      0 24px 70px rgba(0,0,0,.55),
      inset 0 1px 0 rgba(var(--p-rgb), .05);
    animation: slide-up 0.3s var(--spring);
  }
  @keyframes slide-up {
    from {
      opacity: 0;
      transform: translateY(20px) scale(0.95);
    }
    to {
      opacity: 1;
      transform: translateY(0) scale(1);
    }
  }
  .popup-icon {
    width: 76px;
    height: 76px;
    margin: 0 auto 20px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 50%;
    background: rgba(var(--accent-rgb), .12);
    border: 1px solid rgba(var(--accent-rgb), .38);
    color: var(--accent);
    animation: bounce 0.6s var(--spring);
  }
  .popup-icon svg { width: 36px; height: 36px; }
  @keyframes bounce {
    0%, 100% { transform: translateY(0); }
    50% { transform: translateY(-8px); }
  }
  .popup-eyebrow {
    font-family: var(--sans);
    font-size: 10px;
    font-weight: 800;
    letter-spacing: 0.18em;
    text-transform: uppercase;
    color: var(--accent);
    margin-bottom: 10px;
  }
  .popup-message {
    font-size: 16px;
    color: var(--p70);
    line-height: 1.6;
    margin-bottom: 26px;
  }
  .popup-close {
    padding: 12px 28px;
    background: var(--primary);
    color: var(--on-primary);
    border: none;
    border-radius: 100px;
    font-family: var(--sans);
    font-size: 14px;
    font-weight: 800;
    letter-spacing: 0.02em;
    cursor: pointer;
    transition: background 0.2s ease, transform 0.2s ease,
                box-shadow 0.2s ease;
  }
  @media (hover: hover) {
    .popup-close:hover {
      background: var(--primary-hover);
      transform: scale(1.05);
      box-shadow: 0 10px 26px rgba(var(--accent-rgb), .28);
    }
  }
  .popup-close:active { transform: scale(0.97); }

  .checker-pattern { image-rendering: pixelated; }

  .error-page {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    min-height: 100vh;
    min-height: 100svh;
    padding: 40px 24px 72px;
    text-align: center;
  }
  .error-skateboard { font-size: 48px; margin-bottom: 16px; animation: skate 2s ease-in-out infinite; }
  @keyframes skate {
    0%, 100% { transform: rotate(-8deg) translateX(-8px); }
    50% { transform: rotate(8deg) translateX(8px); }
  }
  .error-code {
    font-family: var(--sans);
    font-weight: 800;
    font-size: clamp(96px, 22vw, 180px);
    line-height: .88;
    color: var(--primary);
    letter-spacing: -0.058em;
  }
  .error-title {
    font-family: var(--serif);
    font-style: italic;
    font-weight: 400;
    font-size: clamp(22px, 5vw, 32px);
    letter-spacing: -0.01em;
    color: var(--accent);
    margin-top: 16px;
  }
  .error-subtitle {
    font-size: 15px;
    color: var(--p70);
    margin-top: 8px;
    line-height: 1.6;
  }
  .error-tips { margin-top: 12px; }
  .error-tip { font-size: 14px; color: var(--gray-mid); }
  .error-button {
    margin-top: 32px;
    display: inline-flex;
    align-items: center;
    gap: 10px;
    padding: .55rem 1.25rem .55rem .6rem;
    background: var(--primary);
    color: var(--on-primary);
    text-decoration: none;
    font-family: var(--sans);
    font-weight: 800;
    font-size: 14px;
    letter-spacing: 0.02em;
    border-radius: 100px;
    transition: background 0.2s ease;
  }
  .error-button-icon {
    display: flex; align-items: center; justify-content: center;
    width: 28px; height: 28px;
    background: var(--on-primary);
    color: var(--primary);
    border-radius: 50%;
    transition: transform 0.35s var(--spring);
  }
  @media (hover: hover) {
    .error-button:hover { background: var(--primary-hover); }
    .error-button:hover .error-button-icon { transform: translateX(-3px); }
  }

  /* Reduced motion: final states, no loops; hover feedback stays (color/border). */
  @media (prefers-reduced-motion: reduce) {
    .marquee-track, .venture-badge, .error-skateboard, .popup-icon,
    .popup-content, .popup-overlay { animation: none; }
    .avatar-wrap, .name-block, .section-label, .link-item, .footer-tag {
      transition-duration: 0.01s !important;
      transition-delay: 0s !important;
    }
    .plax-layer { transform: none !important; transition: none !important; }
  }
  "
}
