// COLORS - (Cream/Black monochrome)
const cream_bg = "#f5f0e6"

const cream_light = "#ebe6db"

const ink_black = "#1a1a1a"

const ink_muted = "#4a4a4a"

// FONTS
const main_font = "'Archivo Black', 'Impact', sans-serif"

const body_font = "'Inter', 'Helvetica Neue', sans-serif"

// MEDIA QUERY BREAKPOINTS
const breakpoint_small_mobile = "375px"

const breakpoint_mobile = "480px"

const breakpoint_tablet = "768px"

const breakpoint_desktop = "1024px"

// MEDIA QUERY GENERATOR
pub fn media_query(query: String, rules: String) -> String {
  "@media " <> query <> " { " <> rules <> " }"
}

pub fn media_max_width(width: String, rules: String) -> String {
  media_query("(max-width: " <> width <> ")", rules)
}

pub fn media_min_width(width: String, rules: String) -> String {
  media_query("(min-width: " <> width <> ")", rules)
}

// ANIMATIONS
pub fn animation_keyframes() -> String {
  "@keyframes fadeIn {
    from { opacity: 0; transform: translateY(10px); }
    to { opacity: 1; transform: translateY(0); }
  }
  @keyframes scaleIn {
    from { transform: scale(0.95); opacity: 0; }
    to { transform: scale(1); opacity: 1; }
  }
  @keyframes slideInUp {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
  }
  @keyframes pulse {
    0%, 100% { transform: scale(1); }
    50% { transform: scale(1.02); }
  }
  @keyframes borderDash {
    0% { stroke-dashoffset: 0; }
    100% { stroke-dashoffset: 628; }
  }
  @keyframes float {
    0%, 100% { transform: translateY(0); }
    50% { transform: translateY(-5px); }
  }
  @keyframes shimmer {
    0% { background-position: -200% 0; }
    100% { background-position: 200% 0; }
  }"
}

fn github_icon_uri() -> String {
  "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='-2 -2 28 28'%3E%3Cpath d='M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z' fill='%23f5f0e6' stroke='%231a1a1a' stroke-width='1.5'/%3E%3C/svg%3E"
}

fn linkedin_icon_uri() -> String {
  "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='-2 -2 28 28'%3E%3Cpath d='M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z' fill='%23f5f0e6' stroke='%231a1a1a' stroke-width='1.5'/%3E%3C/svg%3E"
}

fn portfolio_icon_uri() -> String {
  "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='-2 -2 28 28'%3E%3Cpath d='M20 7h-4V5c0-1.1-.9-2-2-2h-4c-1.1 0-2 .9-2 2v2H4c-1.1 0-2 .9-2 2v10c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V9c0-1.1-.9-2-2-2zM10 5h4v2h-4V5zm10 14H4V9h16v10z' fill='%23f5f0e6' stroke='%231a1a1a' stroke-width='1.5'/%3E%3Ccircle cx='12' cy='14' r='2' fill='%231a1a1a'/%3E%3C/svg%3E"
}

fn twitter_icon_uri() -> String {
  "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='-2 -2 28 28'%3E%3Cpath d='M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z' fill='%23f5f0e6' stroke='%231a1a1a' stroke-width='1.5'/%3E%3C/svg%3E"
}

fn blog_icon_uri() -> String {
  "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='-2 -2 28 28'%3E%3Cpath d='M19 3H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm0 16H5V5h14v14zM7 7h10v2H7V7zm0 4h10v2H7v-2zm0 4h7v2H7v-2z' fill='%23f5f0e6' stroke='%231a1a1a' stroke-width='1.2'/%3E%3C/svg%3E"
}

// Background pattern - Skateboard side view monogram
fn vans_pattern_uri() -> String {
  "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='380' height='320' viewBox='0 0 380 320'%3E%3Cdefs%3E%3Cstyle%3E.deck%7Bfill:%23ebe6dc;stroke:%23ddd8ce;stroke-width:2;%7D.truck%7Bfill:%23ddd8ce;%7D.wheel%7Bfill:%23e8e3d9;stroke:%23ddd8ce;stroke-width:2;%7D.tx%7Bfont-family:Impact,Haettenschweiler,sans-serif;fill:%23ddd8ce;%7D.otw%7Bfill:none;stroke:%23ddd8ce;stroke-width:1.5;%7D%3C/style%3E%3C/defs%3E%3Cg transform='translate(20,40) rotate(-12)'%3E%3Cpath class='deck' d='M0,8 Q8,-2 20,2 L100,2 Q112,-2 120,8 L120,12 Q112,22 100,18 L20,18 Q8,22 0,12 Z'/%3E%3Crect class='truck' x='22' y='18' width='12' height='6' rx='1'/%3E%3Crect class='truck' x='86' y='18' width='12' height='6' rx='1'/%3E%3Ccircle class='wheel' cx='28' cy='32' r='8'/%3E%3Ccircle class='wheel' cx='92' cy='32' r='8'/%3E%3C/g%3E%3Cg transform='translate(220,20) rotate(5)'%3E%3Cellipse class='otw' cx='50' cy='18' rx='48' ry='16'/%3E%3Ctext class='tx' x='18' y='15' font-size='9'%3EVANS%3C/text%3E%3Ctext class='tx' x='8' y='26' font-size='7'%3E%22OFF THE WALL%22%3C/text%3E%3C/g%3E%3Cg transform='translate(200,100) rotate(-6)'%3E%3Cpath class='deck' d='M0,8 Q8,-2 20,2 L100,2 Q112,-2 120,8 L120,12 Q112,22 100,18 L20,18 Q8,22 0,12 Z'/%3E%3Crect class='truck' x='22' y='18' width='12' height='6' rx='1'/%3E%3Crect class='truck' x='86' y='18' width='12' height='6' rx='1'/%3E%3Ccircle class='wheel' cx='28' cy='32' r='8'/%3E%3Ccircle class='wheel' cx='92' cy='32' r='8'/%3E%3C/g%3E%3Cg transform='translate(20,150) rotate(6)'%3E%3Cellipse class='otw' cx='45' cy='15' rx='42' ry='13'/%3E%3Ctext class='tx' x='15' y='12' font-size='8'%3EVANS%3C/text%3E%3Ctext class='tx' x='8' y='22' font-size='6'%3E%22OFF THE WALL%22%3C/text%3E%3C/g%3E%3Cg transform='translate(50,210) rotate(-5)'%3E%3Cpath class='deck' d='M0,6 Q6,-2 16,2 L80,2 Q90,-2 96,6 L96,10 Q90,18 80,14 L16,14 Q6,18 0,10 Z'/%3E%3Crect class='truck' x='18' y='14' width='10' height='5' rx='1'/%3E%3Crect class='truck' x='68' y='14' width='10' height='5' rx='1'/%3E%3Ccircle class='wheel' cx='23' cy='26' r='7'/%3E%3Ccircle class='wheel' cx='73' cy='26' r='7'/%3E%3C/g%3E%3Cg transform='translate(220,200) rotate(8)'%3E%3Cpath class='deck' d='M0,8 Q8,-2 20,2 L100,2 Q112,-2 120,8 L120,12 Q112,22 100,18 L20,18 Q8,22 0,12 Z'/%3E%3Crect class='truck' x='22' y='18' width='12' height='6' rx='1'/%3E%3Crect class='truck' x='86' y='18' width='12' height='6' rx='1'/%3E%3Ccircle class='wheel' cx='28' cy='32' r='8'/%3E%3Ccircle class='wheel' cx='92' cy='32' r='8'/%3E%3C/g%3E%3Cg transform='translate(150,275) rotate(3)'%3E%3Cellipse class='otw' cx='50' cy='16' rx='48' ry='14'/%3E%3Ctext class='tx' x='18' y='13' font-size='8'%3EVANS%3C/text%3E%3Ctext class='tx' x='10' y='24' font-size='7'%3E%22OFF THE WALL%22%3C/text%3E%3C/g%3E%3C/svg%3E"
}

// STYLES
pub fn general_styles() -> String {
  "@import url('https://fonts.googleapis.com/css2?family=Archivo+Black&family=Inter:wght@400;500;600;700&display=swap');
  
  *, *::before, *::after {
    box-sizing: border-box;
  }
  
  html, body {
    margin: 0;
    padding: 0;
    width: 100%;
    height: 100%;
    min-height: 100vh;
    min-height: 100dvh;
    min-height: -webkit-fill-available;
    background-color: " <> cream_bg <> ";
    background-image: url(\"" <> vans_pattern_uri() <> "\");
    background-repeat: repeat;
    background-size: 380px 320px;
    overflow-x: hidden;
  }
  
  @media (max-width: " <> breakpoint_mobile <> ") {
    html, body {
      background-image: none;
    }
  }
  
  #app {
    width: 100%;
    min-height: 100vh;
    min-height: 100dvh;
    min-height: -webkit-fill-available;
  }
  
  " <> animation_keyframes() <> "
  " <> responsive_styles()
}

// RESPONSIVE STYLES
pub fn responsive_styles() -> String {
  base_styles()
  <> tablet_styles()
  <> mobile_styles()
  <> small_mobile_styles()
  <> desktop_styles()
}

fn base_styles() -> String {
  "
  .root {
    padding: 20px 0;
    margin: 0;
    min-height: 100vh;
    min-height: 100dvh;
    min-height: -webkit-fill-available;
    width: 100%;
    background-color: " <> cream_bg <> ";
    background-image: url(\"" <> vans_pattern_uri() <> "\");
    background-repeat: repeat;
    background-size: 380px 320px;
    color: " <> ink_black <> ";
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    font-family: " <> body_font <> ";
    -webkit-font-smoothing: antialiased;
    box-sizing: border-box;
  }
  
  @media (max-width: " <> breakpoint_mobile <> ") {
    .root {
      background-image: none;
      padding: 16px 0;
      justify-content: flex-start;
    }
  }
  
  .container {
    max-width: 400px;
    width: 90%;
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 0;
    margin: 0 auto;
    background: transparent;
  }
  
  /* Profile Card */
  .profile-card {
    background-color: " <> cream_bg <> ";
    border: 3px solid " <> ink_black <> ";
    box-shadow: 5px 5px 0 " <> ink_black <> ";
    padding: 20px 18px 16px;
    width: 100%;
    margin-bottom: 16px;
    animation: slideInUp 0.5s ease-out;
    position: relative;
    overflow: hidden;
  }
  
  .profile-card::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 3px;
    background: linear-gradient(90deg, " <> ink_black <> " 0%, " <> ink_muted <> " 50%, " <> ink_black <> " 100%);
    background-size: 200% 100%;
    animation: shimmer 3s ease-in-out infinite;
  }
  
  .profile {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    width: 100%;
  }
  
  /* Avatar with decorative border */
  .avatar-wrapper {
    position: relative;
    margin-bottom: 12px;
  }
  
  .avatar {
    width: 90px;
    height: 90px;
    border-radius: 50%;
    border: 3px solid " <> ink_black <> ";
    background-color: " <> cream_light <> ";
    object-fit: cover;
    position: relative;
    z-index: 2;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
  }
  
  .avatar:hover {
    transform: scale(1.05);
    box-shadow: 0 6px 16px rgba(26, 26, 26, 0.2);
  }
  
  .avatar-ring {
    position: absolute;
    top: -6px;
    left: -6px;
    width: 102px;
    height: 102px;
    border: 2px dashed " <> ink_muted <> ";
    border-radius: 50%;
    animation: spin 20s linear infinite;
  }
  
  @keyframes spin {
    from { transform: rotate(0deg); }
    to { transform: rotate(360deg); }
  }
  
  .profile-name {
    font-size: 22px;
    font-weight: 900;
    margin: 0 0 6px 0;
    color: " <> ink_black <> ";
    font-family: " <> main_font <> ";
    letter-spacing: 1.5px;
    text-transform: uppercase;
    position: relative;
    display: inline-block;
  }
  
  .profile-name::after {
    content: '';
    position: absolute;
    bottom: -2px;
    left: 50%;
    transform: translateX(-50%);
    width: 50px;
    height: 2px;
    background-color: " <> ink_black <> ";
  }
  
  .profile-bio {
    font-size: 11px;
    font-weight: 600;
    margin: 10px 0 0 0;
    color: " <> ink_muted <> ";
    max-width: 280px;
    line-height: 1.4;
    letter-spacing: 0.2px;
    font-family: " <> body_font <> ";
  }
  
  .profile-bio-separator {
    color: " <> ink_black <> ";
    font-weight: 700;
  }
  
  /* Status badge */
  .status-badge {
    display: inline-flex;
    align-items: center;
    gap: 5px;
    margin-top: 10px;
    padding: 4px 10px;
    background-color: " <> cream_light <> ";
    border: 2px solid " <> ink_black <> ";
    font-size: 9px;
    font-weight: 700;
    font-family: " <> body_font <> ";
    text-transform: uppercase;
    letter-spacing: 0.5px;
  }
  
  .status-dot {
    width: 6px;
    height: 6px;
    background-color: #22c55e;
    border-radius: 50%;
    animation: pulse 2s ease-in-out infinite;
  }
  
  /* Section Title */
  .section-title {
    width: 100%;
    display: flex;
    align-items: center;
    gap: 10px;
    margin-bottom: 10px;
    animation: slideInUp 0.5s ease-out 0.2s backwards;
  }
  
  .section-title-line {
    flex: 1;
    height: 2px;
    background-color: " <> ink_black <> ";
  }
  
  .section-title-text {
    font-size: 9px;
    font-weight: 700;
    font-family: " <> main_font <> ";
    text-transform: uppercase;
    letter-spacing: 1.5px;
    color: " <> ink_muted <> ";
    white-space: nowrap;
  }
  
  .main-content {
    display: flex;
    flex-direction: column;
    align-items: stretch;
    gap: 8px;
    width: 100%;
    margin-bottom: 12px;
  }
  
  .link {
    display: flex;
    align-items: center;
    gap: 10px;
    width: 100%;
    padding: 10px 12px;
    background-color: " <> cream_bg <> ";
    color: " <> ink_black <> ";
    text-decoration: none;
    font-size: 14px;
    font-weight: 700;
    text-align: left;
    transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
    cursor: pointer;
    font-family: " <> main_font <> ";
    position: relative;
    box-sizing: border-box;
    animation: slideInUp 0.5s ease-out backwards;
    border: 3px solid " <> ink_black <> ";
    box-shadow: 4px 4px 0 " <> ink_black <> ";
  }
  
  .link:nth-child(1) { animation-delay: 0.3s; }
  .link:nth-child(2) { animation-delay: 0.35s; }
  .link:nth-child(3) { animation-delay: 0.4s; }
  .link:nth-child(4) { animation-delay: 0.45s; }
  .link:nth-child(5) { animation-delay: 0.5s; }
  
  .link::after {
    content: '→';
    position: absolute;
    right: 12px;
    font-size: 14px;
    opacity: 0;
    transform: translateX(-10px);
    transition: all 0.2s ease;
  }
  
  .link-hover {
    transform: translate(2px, 2px);
    box-shadow: 2px 2px 0 " <> ink_black <> ";
    background-color: " <> ink_black <> ";
    color: " <> cream_bg <> ";
  }
  
  .link-hover::after {
    opacity: 1;
    transform: translateX(0);
    color: " <> cream_bg <> ";
  }
  
  .link-hover .link-icon {
    transform: scale(1.1) rotate(-5deg);
    filter: brightness(0) invert(1);
  }
  
  .link-hover .link-text {
    color: " <> cream_bg <> ";
  }
  
  .link-icon {
    width: 22px;
    height: 22px;
    flex-shrink: 0;
    transition: all 0.2s ease;
    background-size: contain;
    background-repeat: no-repeat;
    background-position: center;
    display: block;
  }
  
  .link-icon-github {
    background-image: url(\"" <> github_icon_uri() <> "\");
  }
  
  .link-icon-linkedin {
    background-image: url(\"" <> linkedin_icon_uri() <> "\");
  }
  
  .link-icon-portfolio {
    background-image: url(\"" <> portfolio_icon_uri() <> "\");
  }
  
  .link-icon-twitter {
    background-image: url(\"" <> twitter_icon_uri() <> "\");
  }
  
  .link-icon-blog {
    background-image: url(\"" <> blog_icon_uri() <> "\");
  }
  
  .link-text {
    flex: 1;
    font-family: " <> main_font <> ";
    font-size: 12px;
    letter-spacing: 0.3px;
    color: " <> ink_black <> ";
    text-transform: uppercase;
    transition: color 0.2s ease;
  }
  
  /* Footer */
  .footer {
    text-align: center;
    padding: 10px 0 0 0;
    color: " <> ink_muted <> ";
    font-size: 11px;
    font-weight: 600;
    width: 100%;
    background: transparent;
    border-top: 2px solid " <> ink_black <> ";
    font-family: " <> body_font <> ";
    animation: slideInUp 0.5s ease-out 0.6s backwards;
  }
  
  .footer-text {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 6px;
  }
  
  .footer-heart {
    color: #7c3aed;
    animation: pulse 1.5s ease-in-out infinite;
  }
  
  /* 404 Error Page Styles */
  .error-page {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    text-align: center;
    padding: 40px 20px;
    animation: fadeIn 0.6s ease-out;
    min-height: 60vh;
  }
  
  .error-skateboard {
    margin-bottom: 20px;
    animation: skateRoll 3s ease-in-out infinite;
  }
  
  @keyframes skateRoll {
    0%, 100% { transform: translateX(-20px) rotate(-5deg); }
    50% { transform: translateX(20px) rotate(5deg); }
  }
  
  .skateboard-emoji {
    font-size: 64px;
    display: block;
    filter: drop-shadow(4px 4px 0 rgba(26, 26, 26, 0.2));
  }
  
  .error-code {
    font-size: 120px;
    font-weight: 900;
    margin: 0;
    color: " <> ink_black <> ";
    font-family: " <> main_font <> ";
    letter-spacing: 8px;
    text-transform: uppercase;
    line-height: 1;
    text-shadow: 
      4px 4px 0 " <> cream_light <> ",
      8px 8px 0 " <> ink_black <> ";
    animation: glitchText 2.5s infinite;
  }
  
  @keyframes glitchText {
    0%, 90%, 100% { 
      text-shadow: 
        4px 4px 0 " <> cream_light <> ",
        8px 8px 0 " <> ink_black <> ";
    }
    92% { 
      text-shadow: 
        -4px 4px 0 " <> cream_light <> ",
        -8px 8px 0 " <> ink_black <> ";
    }
    94% { 
      text-shadow: 
        4px -4px 0 " <> cream_light <> ",
        8px -8px 0 " <> ink_black <> ";
    }
    96% { 
      text-shadow: 
        4px 4px 0 " <> cream_light <> ",
        8px 8px 0 " <> ink_black <> ";
    }
  }
  
  .error-title {
    font-size: 28px;
    font-weight: 900;
    margin: 16px 0 8px 0;
    color: " <> ink_black <> ";
    font-family: " <> main_font <> ";
    letter-spacing: 1px;
    text-transform: uppercase;
  }
  
  .error-subtitle {
    font-size: 16px;
    font-weight: 500;
    margin: 0 0 24px 0;
    color: " <> ink_muted <> ";
    font-family: " <> body_font <> ";
    max-width: 300px;
    line-height: 1.5;
  }
  
  .error-tips {
    margin-bottom: 32px;
    padding: 16px 24px;
    background-color: " <> cream_light <> ";
    border: 3px solid " <> ink_black <> ";
    box-shadow: 4px 4px 0 " <> ink_black <> ";
  }
  
  .error-tip {
    margin: 0;
    font-size: 14px;
    font-weight: 600;
    color: " <> ink_muted <> ";
    font-family: " <> body_font <> ";
  }
  
  .error-button {
    display: inline-flex;
    align-items: center;
    gap: 12px;
    padding: 14px 28px;
    background-color: " <> ink_black <> ";
    color: " <> cream_bg <> ";
    text-decoration: none;
    font-size: 16px;
    font-weight: 700;
    font-family: " <> main_font <> ";
    letter-spacing: 1px;
    text-transform: uppercase;
    border: 3px solid " <> ink_black <> ";
    box-shadow: 4px 4px 0 " <> ink_muted <> ";
    transition: all 0.15s ease;
    cursor: pointer;
  }
  
  .error-button:hover {
    transform: translate(2px, 2px);
    box-shadow: 2px 2px 0 " <> ink_muted <> ";
    background-color: " <> ink_muted <> ";
  }
  
  .error-button:active {
    transform: translate(4px, 4px);
    box-shadow: 0 0 0 " <> ink_muted <> ";
  }
  
  .error-button-icon {
    font-size: 20px;
    transition: transform 0.2s ease;
  }
  
  .error-button:hover .error-button-icon {
    transform: translateX(-4px);
  }
  
  .error-button-text {
    font-size: 14px;
  }
  "
}

fn tablet_styles() -> String {
  media_max_width(
    breakpoint_tablet,
    "
    .root {
      padding: 16px 0;
    }
    .container {
      width: 88%;
      max-width: 380px;
    }
    .profile-card {
      padding: 18px 16px 14px;
      box-shadow: 4px 4px 0 " <> ink_black <> ";
      margin-bottom: 14px;
    }
    .avatar-wrapper {
      margin-bottom: 10px;
    }
    .avatar {
      width: 80px;
      height: 80px;
    }
    .avatar-ring {
      width: 92px;
      height: 92px;
      top: -5px;
      left: -5px;
    }
    .profile-name {
      font-size: 20px;
    }
    .profile-bio {
      font-size: 10px;
      max-width: 90%;
    }
    .status-badge {
      margin-top: 8px;
      padding: 4px 10px;
      font-size: 8px;
    }
    .section-title {
      margin-bottom: 8px;
      gap: 8px;
    }
    .section-title-text {
      font-size: 8px;
      letter-spacing: 1px;
    }
    .link {
      padding: 9px 11px;
      gap: 9px;
      box-shadow: 3px 3px 0 " <> ink_black <> ";
    }
    .link::after {
      right: 11px;
      font-size: 13px;
    }
    .link-icon {
      width: 20px;
      height: 20px;
    }
    .link-text {
      font-size: 11px;
    }
    .main-content {
      gap: 7px;
      margin-bottom: 10px;
    }
    .footer {
      padding: 8px 0 0 0;
      font-size: 10px;
    }
    /* 404 tablet styles */
    .error-page {
      padding: 30px 15px;
    }
    .skateboard-emoji {
      font-size: 56px;
    }
    .error-code {
      font-size: 100px;
      letter-spacing: 6px;
    }
    .error-title {
      font-size: 24px;
    }
    .error-subtitle {
      font-size: 14px;
    }
    .error-tips {
      padding: 14px 20px;
    }
    .error-button {
      padding: 12px 24px;
    }
    ",
  )
}

fn mobile_styles() -> String {
  media_max_width(
    breakpoint_mobile,
    "
    .root {
      padding: 12px 0;
      justify-content: flex-start;
    }
    .container {
      width: 92%;
      max-width: 360px;
    }
    .profile-card {
      padding: 16px 14px 12px;
      border-width: 2px;
      box-shadow: 3px 3px 0 " <> ink_black <> ";
      margin-bottom: 12px;
    }
    .profile-card::before {
      height: 2px;
    }
    .avatar-wrapper {
      margin-bottom: 10px;
    }
    .avatar {
      width: 70px;
      height: 70px;
      border-width: 2px;
    }
    .avatar-ring {
      width: 82px;
      height: 82px;
      top: -4px;
      left: -4px;
      border-width: 2px;
    }
    .profile-name {
      font-size: 18px;
      letter-spacing: 1px;
    }
    .profile-name::after {
      width: 35px;
      height: 2px;
    }
    .profile-bio {
      font-size: 9px;
      max-width: 95%;
      margin-top: 8px;
    }
    .status-badge {
      margin-top: 8px;
      padding: 3px 8px;
      font-size: 7px;
      border-width: 1px;
    }
    .status-dot {
      width: 5px;
      height: 5px;
    }
    .section-title {
      margin-bottom: 6px;
      gap: 6px;
    }
    .section-title-text {
      font-size: 7px;
      letter-spacing: 1px;
    }
    .section-title-line {
      height: 1px;
    }
    .link {
      padding: 8px 10px;
      gap: 8px;
      border-width: 2px;
      box-shadow: 2px 2px 0 " <> ink_black <> ";
    }
    .link::after {
      right: 10px;
      font-size: 12px;
    }
    .link-hover {
      transform: translate(1px, 1px);
      box-shadow: 1px 1px 0 " <> ink_black <> ";
    }
    .link-icon {
      width: 18px;
      height: 18px;
    }
    .link-text {
      font-size: 10px;
    }
    .main-content {
      gap: 6px;
      margin-bottom: 10px;
    }
    .footer {
      padding: 8px 0 0 0;
      font-size: 9px;
    }
    /* 404 mobile styles */
    .error-page {
      padding: 20px 15px;
      min-height: auto;
    }
    .skateboard-emoji {
      font-size: 48px;
    }
    .error-code {
      font-size: 72px;
      letter-spacing: 4px;
      text-shadow: 
        3px 3px 0 " <> cream_light <> ",
        6px 6px 0 " <> ink_black <> ";
    }
    .error-title {
      font-size: 20px;
      margin: 12px 0 6px 0;
    }
    .error-subtitle {
      font-size: 13px;
      margin-bottom: 20px;
    }
    .error-tips {
      padding: 12px 16px;
      margin-bottom: 24px;
      border-width: 2px;
      box-shadow: 3px 3px 0 " <> ink_black <> ";
    }
    .error-tip {
      font-size: 12px;
    }
    .error-button {
      padding: 10px 20px;
      gap: 10px;
      border-width: 2px;
      box-shadow: 3px 3px 0 " <> ink_muted <> ";
    }
    .error-button-icon {
      font-size: 18px;
    }
    .error-button-text {
      font-size: 12px;
    }
    ",
  )
}

fn small_mobile_styles() -> String {
  media_max_width(
    breakpoint_small_mobile,
    "
    .root {
      padding: 10px 0;
    }
    .container {
      width: 94%;
      max-width: 340px;
    }
    .profile-card {
      padding: 14px 12px 10px;
      box-shadow: 2px 2px 0 " <> ink_black <> ";
      margin-bottom: 10px;
    }
    .avatar-wrapper {
      margin-bottom: 8px;
    }
    .avatar {
      width: 60px;
      height: 60px;
    }
    .avatar-ring {
      width: 72px;
      height: 72px;
      top: -4px;
      left: -4px;
    }
    .profile-name {
      font-size: 16px;
    }
    .profile-name::after {
      width: 28px;
    }
    .profile-bio {
      font-size: 8px;
      margin-top: 6px;
    }
    .status-badge {
      margin-top: 6px;
      padding: 2px 6px;
      font-size: 6px;
      gap: 3px;
    }
    .status-dot {
      width: 4px;
      height: 4px;
    }
    .section-title {
      margin-bottom: 5px;
      gap: 5px;
    }
    .section-title-text {
      font-size: 6px;
    }
    .link {
      padding: 7px 9px;
      gap: 7px;
      box-shadow: 2px 2px 0 " <> ink_black <> ";
    }
    .link::after {
      right: 9px;
      font-size: 10px;
    }
    .link-icon {
      width: 16px;
      height: 16px;
    }
    .link-text {
      font-size: 9px;
    }
    .main-content {
      gap: 5px;
      margin-bottom: 8px;
    }
    .footer {
      padding: 6px 0 0 0;
      font-size: 8px;
    }
    /* 404 small mobile styles */
    .error-page {
      padding: 15px 10px;
      min-height: auto;
    }
    .skateboard-emoji {
      font-size: 36px;
    }
    .error-code {
      font-size: 48px;
      letter-spacing: 2px;
      text-shadow: 
        2px 2px 0 " <> cream_light <> ",
        4px 4px 0 " <> ink_black <> ";
    }
    .error-title {
      font-size: 14px;
    }
    .error-subtitle {
      font-size: 10px;
    }
    .error-tips {
      padding: 8px 12px;
    }
    .error-tip {
      font-size: 9px;
    }
    .error-button {
      padding: 8px 14px;
      gap: 6px;
    }
    .error-button-icon {
      font-size: 14px;
    }
    .error-button-text {
      font-size: 10px;
    }
    ",
  )
}

fn desktop_styles() -> String {
  media_min_width(
    breakpoint_desktop,
    "
    .root {
      padding: 24px 0;
    }
    .container {
      max-width: 420px;
    }
    .profile-card {
      padding: 24px 22px 18px;
      box-shadow: 6px 6px 0 " <> ink_black <> ";
      margin-bottom: 18px;
    }
    .avatar-wrapper {
      margin-bottom: 14px;
    }
    .avatar {
      width: 100px;
      height: 100px;
      border-width: 4px;
    }
    .avatar-ring {
      width: 116px;
      height: 116px;
      top: -8px;
      left: -8px;
    }
    .profile-name {
      font-size: 26px;
      letter-spacing: 2px;
    }
    .profile-name::after {
      width: 60px;
      height: 3px;
      bottom: -3px;
    }
    .profile-bio {
      font-size: 12px;
      max-width: 320px;
      margin-top: 12px;
    }
    .status-badge {
      margin-top: 12px;
      padding: 5px 12px;
      font-size: 10px;
    }
    .section-title {
      margin-bottom: 12px;
      gap: 12px;
    }
    .section-title-text {
      font-size: 10px;
      letter-spacing: 2px;
    }
    .section-title-line {
      height: 2px;
    }
    .link {
      padding: 12px 14px;
      gap: 12px;
      box-shadow: 5px 5px 0 " <> ink_black <> ";
    }
    .link::after {
      right: 14px;
      font-size: 16px;
    }
    .link-hover {
      transform: translate(3px, 3px);
      box-shadow: 2px 2px 0 " <> ink_black <> ";
    }
    .link-icon {
      width: 24px;
      height: 24px;
    }
    .link-text {
      font-size: 14px;
    }
    .main-content {
      gap: 10px;
      margin-bottom: 14px;
    }
    .footer {
      padding: 12px 0 0 0;
      font-size: 12px;
    }
    ",
  )
}
