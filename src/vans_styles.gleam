pub fn vans_styles() -> String {
  "@import url('https://fonts.googleapis.com/css2?family=Anton&family=Space+Grotesk:wght@300;400;500;600&display=swap');

  *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

  :root {
    --bg:        #EDE8DF;
    --bg2:       #E4DDD3;
    --red:       #E31837;
    --black:     #111111;
    --white:     #FAFAF7;
    --muted:     #7A7066;
    --font-display: 'Anton', sans-serif;
    --font-body:    'Space Grotesk', sans-serif;
    --spring:    cubic-bezier(0.34, 1.56, 0.64, 1);
  }

  html, body {
    width: 100%; height: 100%;
    background: var(--bg);
    font-family: var(--font-body);
    color: var(--black);
    overflow-x: hidden;
    cursor: none;
  }

  a, button, [role='button'] { cursor: none; }

  #cursor {
    position: fixed;
    width: 10px;
    height: 10px;
    background: var(--red);
    border-radius: 50%;
    pointer-events: none;
    z-index: 9999;
    top: -100px;
    left: -100px;
    transform: translate(-50%, -50%);
    transition: width 0.2s ease, height 0.2s ease, opacity 0.2s ease;
  }

  .checker-tl, .checker-br {
    position: fixed;
    width: 72px; height: 72px;
    pointer-events: none;
    z-index: 10;
  }
  .checker-tl { top: 0; left: 0; }
  .checker-br { bottom: 0; right: 0; }

  .geo-bar {
    position: absolute;
    background: var(--white);
    opacity: 0.75;
  }

  .marquee-wrap {
    position: fixed;
    bottom: 0; left: 0; right: 0;
    height: 36px;
    background: var(--red);
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
  }
  .marquee-track span {
    font-family: var(--font-display);
    font-size: 13px;
    letter-spacing: 0.12em;
    color: var(--white);
    padding: 0 32px;
  }
  .marquee-track .dot {
    color: var(--white);
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
    font-family: var(--font-display);
    font-size: 11px;
    letter-spacing: 0.25em;
    color: var(--muted);
    white-space: nowrap;
    pointer-events: none;
    z-index: 10;
  }
  @media (max-width: 768px) {
    .side-label { display: none; }
  }

  .page {
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 60px 24px 72px;
    position: relative;
    overflow: hidden;
  }

  .parallax-bg {
    position: absolute;
    inset: -60px;
    pointer-events: none;
    z-index: 0;
  }
  .parallax-circle {
    position: absolute;
    border-radius: 50%;
    background: var(--bg2);
    opacity: 0.6;
  }

  .bg-word {
    position: absolute;
    font-family: var(--font-display);
    letter-spacing: -0.01em;
    color: transparent;
    -webkit-text-stroke: 1px rgba(17,17,17,0.055);
    white-space: nowrap;
    pointer-events: none;
    user-select: none;
    line-height: 1;
  }
  .bg-checker-strip {
    position: absolute;
    background-image: repeating-conic-gradient(rgba(17,17,17,0.06) 0% 25%, transparent 0% 50%);
    background-size: 16px 16px;
    pointer-events: none;
  }
  .bg-deco {
    position: absolute;
    pointer-events: none;
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
    transition: opacity 0.7s ease 0.1s, transform 0.7s ease 0.1s;
  }
  .avatar-wrap.visible {
    opacity: 1;
    transform: translateY(0);
  }
  .avatar-ring {
    width: 96px; height: 96px;
    border-radius: 50%;
    border: 3px solid var(--red);
    display: flex; align-items: center; justify-content: center;
    background: var(--bg2);
    position: relative;
    overflow: hidden;
  }
  .avatar-placeholder {
    width: 100%; height: 100%;
    display: flex; align-items: center; justify-content: center;
    background: repeating-linear-gradient(
      45deg,
      var(--bg2) 0px, var(--bg2) 6px,
      var(--white) 6px, var(--white) 12px
    );
    font-family: var(--font-display);
    font-size: 28px;
    color: var(--muted);
    letter-spacing: 0.01em;
  }
  .avatar-badge {
    position: absolute;
    bottom: -4px; right: -4px;
    width: 28px; height: 28px;
    background: var(--red);
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
    transition: opacity 0.7s ease 0.25s, transform 0.7s ease 0.25s;
  }
  .name-block.visible { opacity: 1; transform: translateY(0); }
  .name {
    font-family: var(--font-display);
    font-size: clamp(38px, 7vw, 64px);
    line-height: 1;
    letter-spacing: 0.02em;
    color: var(--black);
  }
  .name-accent { color: var(--red); }

  .otw-tag {
    display: inline-block;
    margin-top: 6px;
    font-family: var(--font-display);
    font-size: 11px;
    letter-spacing: 0.22em;
    color: var(--white);
    background: var(--red);
    padding: 3px 10px;
    text-transform: uppercase;
  }

  .tagline {
    margin-top: 10px;
    font-size: 12px;
    color: var(--muted);
    letter-spacing: 0.08em;
    line-height: 1.7;
    text-align: center;
    max-width: 360px;
  }
  .tagline code {
    font-family: 'Space Grotesk', monospace;
    color: var(--red);
    font-size: 11px;
  }

  .divider {
    width: 100%;
    height: 1px;
    background: linear-gradient(90deg, transparent, var(--black) 20%, var(--black) 80%, transparent);
    opacity: 0.12;
    margin: 24px 0 20px;
  }

  .section-label {
    font-family: var(--font-display);
    font-size: 14px;
    letter-spacing: 0.1em;
    color: var(--muted);
    text-transform: uppercase;
    align-self: flex-start;
    margin-bottom: 8px;
    opacity: 0;
    transform: translateX(-12px);
    transition: opacity 0.5s ease, transform 0.5s ease;
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
    border-radius: 8px;
    border-bottom: 1px solid rgba(17,17,17,0.07);
    text-decoration: none;
    color: var(--black);
    overflow: hidden;
    cursor: none;
    opacity: 0;
    transform: translateX(-20px);
    transition: opacity 0.5s ease, transform 0.5s ease,
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
    background: rgba(17,17,17,0.04);
    border-radius: 8px;
    opacity: 0;
    transition: opacity 0.25s ease;
    z-index: 0;
  }
  .link-item::after {
    content: '';
    position: absolute;
    left: 0; top: 10px; bottom: 10px;
    width: 3px;
    background: var(--red);
    border-radius: 0 2px 2px 0;
    transform: scaleY(0);
    transform-origin: center;
    transition: transform 0.35s var(--spring);
    z-index: 2;
  }
  .link-item:hover::before { opacity: 1; }
  .link-item:hover::after  { transform: scaleY(1); }
  .link-item:hover .link-label { color: var(--red); }
  .link-item:hover .link-arrow { opacity: 1; transform: translateX(0); }
  .link-item:hover .link-icon {
    background: var(--red);
    border-color: var(--red);
    transform: scale(1.1);
  }
  .link-item:hover .link-info { transform: translateX(5px); }
  .link-item:hover .link-icon svg path,
  .link-item:hover .link-icon svg rect,
  .link-item:hover .link-icon svg circle,
  .link-item:hover .link-icon svg line { stroke: var(--white); }
  .link-item:hover .link-icon svg path[fill='#111'],
  .link-item:hover .link-icon svg rect[fill='#111'],
  .link-item:hover .link-icon svg circle[fill='#111'] { fill: var(--white); }

  .link-icon {
    position: relative;
    z-index: 1;
    width: 36px; height: 36px;
    border-radius: 8px;
    background: var(--bg2);
    border: 1px solid rgba(17,17,17,0.08);
    display: flex; align-items: center; justify-content: center;
    flex-shrink: 0;
    transition: background 0.2s ease, border-color 0.2s ease,
                transform 0.4s var(--spring);
  }
  .link-icon svg { width: 16px; height: 16px; }

  .link-info {
    position: relative;
    z-index: 1;
    flex: 1;
    display: flex;
    flex-direction: column;
    gap: 1px;
    transition: transform 0.35s var(--spring);
  }

  .link-label {
    font-size: 14px;
    font-weight: 500;
    letter-spacing: 0.01em;
    transition: color 0.2s ease;
  }
  .link-sub {
    font-size: 11px;
    color: var(--muted);
    letter-spacing: 0.04em;
  }

  .link-arrow {
    position: relative;
    z-index: 1;
    opacity: 0;
    transform: translateX(-6px);
    transition: opacity 0.25s ease, transform 0.35s var(--spring);
    color: var(--red);
  }
  .link-arrow svg { width: 14px; height: 14px; }

  .footer-tag {
    margin-top: 28px;
    font-family: var(--font-display);
    font-size: 10px;
    letter-spacing: 0.25em;
    color: var(--muted);
    opacity: 0;
    transition: opacity 0.7s ease 1.2s;
  }
  .footer-tag.visible { opacity: 1; }

  .checker-pattern { image-rendering: pixelated; }

  .error-page {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    min-height: 100vh;
    padding: 40px 24px 72px;
    text-align: center;
  }
  .error-skateboard { font-size: 48px; margin-bottom: 16px; animation: skate 2s ease-in-out infinite; }
  @keyframes skate {
    0%, 100% { transform: rotate(-8deg) translateX(-8px); }
    50% { transform: rotate(8deg) translateX(8px); }
  }
  .error-code {
    font-family: var(--font-display);
    font-size: clamp(80px, 20vw, 160px);
    line-height: 1;
    color: var(--black);
    letter-spacing: 0.02em;
  }
  .error-title {
    font-family: var(--font-display);
    font-size: clamp(16px, 4vw, 24px);
    letter-spacing: 0.08em;
    color: var(--black);
    margin-top: 12px;
  }
  .error-subtitle {
    font-size: 13px;
    color: var(--muted);
    margin-top: 8px;
    letter-spacing: 0.04em;
  }
  .error-tips { margin-top: 16px; }
  .error-tip { font-size: 13px; color: var(--muted); }
  .error-button {
    margin-top: 32px;
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 12px 24px;
    background: var(--black);
    color: var(--white);
    text-decoration: none;
    font-family: var(--font-display);
    font-size: 13px;
    letter-spacing: 0.12em;
    transition: background 0.2s ease;
  }
  .error-button:hover { background: var(--red); }
  "
}
