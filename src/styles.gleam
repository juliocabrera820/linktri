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
    padding: 0;
    margin: 0;
    min-height: 100vh;
    min-height: 100dvh;
    min-height: -webkit-fill-available;
    height: 100vh;
    height: 100dvh;
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
  }
  
  @media (max-width: " <> breakpoint_mobile <> ") {
    .root {
      background-image: none;
      padding: 10px 0;
      height: auto;
      min-height: 100vh;
      min-height: 100dvh;
      min-height: -webkit-fill-available;
    }
  }
  
  .container {
    max-width: 420px;
    width: 92%;
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 0;
    margin: 0 auto;
    background: transparent;
  }
  
  .profile {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-bottom: 20px;
    text-align: center;
    width: 100%;
    animation: fadeIn 0.6s ease-out;
  }
  
  .avatar {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    margin-bottom: 12px;
    border: 3px solid " <> ink_black <> ";
    background-color: " <> cream_light <> ";
    object-fit: cover;
    animation: scaleIn 0.5s ease-out;
  }
  
  .profile-name {
    font-size: 24px;
    font-weight: 900;
    margin: 0 0 4px 0;
    color: " <> ink_black <> ";
    font-family: " <> main_font <> ";
    letter-spacing: 1px;
    text-transform: uppercase;
  }
  
  .profile-bio {
    font-size: 14px;
    font-weight: 800;
    margin: 0;
    color: " <> ink_muted <> ";
    max-width: 320px;
    line-height: 1.4;
    letter-spacing: 0.2px;
  }
  
  .main-content {
    display: flex;
    flex-direction: column;
    align-items: stretch;
    gap: 8px;
    width: 100%;
    margin-bottom: 16px;
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
    font-size: 16px;
    font-weight: 700;
    text-align: left;
    transition: all 0.15s ease;
    cursor: pointer;
    font-family: " <> main_font <> ";
    position: relative;
    box-sizing: border-box;
    animation: fadeIn 0.5s ease-out backwards;
    border: 3px solid " <> ink_black <> ";
    box-shadow: 4px 4px 0 " <> ink_black <> ";
  }
  
  .link:nth-child(1) { animation-delay: 0.1s; }
  .link:nth-child(2) { animation-delay: 0.15s; }
  .link:nth-child(3) { animation-delay: 0.2s; }
  .link:nth-child(4) { animation-delay: 0.25s; }
  .link:nth-child(5) { animation-delay: 0.3s; }
  
  .link-hover {
    transform: translate(2px, 2px);
    box-shadow: 2px 2px 0 " <> ink_black <> ";
  }
  
  .link-hover .link-icon {
    transform: scale(1.05);
  }
  
  .link-icon {
    width: 24px;
    height: 24px;
    flex-shrink: 0;
    transition: transform 0.15s ease;
    background-size: contain;
    background-repeat: no-repeat;
    background-position: center;
    display: block;
    filter: drop-shadow(2px 2px 0 rgba(26, 26, 26, 0.15));
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
    font-size: 14px;
    letter-spacing: 0.3px;
    color: " <> ink_black <> ";
  }
  
  .footer {
    text-align: center;
    padding: 12px 0 0 0;
    color: " <> ink_muted <> ";
    font-size: 16px;
    font-weight: 600;
    width: 100%;
    background: transparent;
    border-top: 2px solid " <> ink_black <> ";
  }
  "
}

fn tablet_styles() -> String {
  media_max_width(
    breakpoint_tablet,
    "
    .container {
      width: 92%;
      padding: 20px 15px 15px;
    }
    .avatar {
      width: 90px;
      height: 90px;
      margin-bottom: 10px;
      box-shadow: 4px 4px 0 " <> ink_black <> ";
    }
    .profile {
      margin-bottom: 14px;
    }
    .profile-name {
      font-size: 22px;
    }
    .profile-bio {
      font-size: 11px;
      max-width: 90%;
    }
    .link {
      padding: 10px 14px;
      gap: 10px;
    }
    .link-icon {
      width: 24px;
      height: 24px;
    }
    .link-text {
      font-size: 14px;
    }
    .main-content {
      gap: 8px;
      margin-bottom: 12px;
    }
    .footer {
      padding: 10px 0;
      font-size: 12px;
    }
    ",
  )
}

fn mobile_styles() -> String {
  media_max_width(
    breakpoint_mobile,
    "
    .container {
      width: 95%;
      padding: 15px 12px 10px;
    }
    .avatar {
      width: 80px;
      height: 80px;
      margin-bottom: 8px;
      box-shadow: 3px 3px 0 " <> ink_black <> ";
      border-width: 2px;
    }
    .profile {
      margin-bottom: 12px;
    }
    .profile-name {
      font-size: 18px;
    }
    .profile-bio {
      font-size: 10px;
      max-width: 95%;
    }
    .link {
      padding: 8px 12px;
      gap: 8px;
      border-width: 2px;
      box-shadow: 3px 3px 0 " <> ink_black <> ";
    }
    .link-hover {
      transform: translate(1px, 1px);
      box-shadow: 2px 2px 0 " <> ink_black <> ";
    }
    .link-icon {
      width: 20px;
      height: 20px;
    }
    .link-text {
      font-size: 13px;
    }
    .main-content {
      gap: 6px;
      margin-bottom: 10px;
    }
    .footer {
      padding: 8px 0;
      font-size: 10px;
    }
    ",
  )
}

fn small_mobile_styles() -> String {
  media_max_width(
    breakpoint_small_mobile,
    "
    .container {
      padding: 10px 8px 8px;
    }
    .avatar {
      width: 70px;
      height: 70px;
      margin-bottom: 6px;
      box-shadow: 2px 2px 0 " <> ink_black <> ";
    }
    .profile-name {
      font-size: 16px;
    }
    .profile-bio {
      font-size: 9px;
    }
    .profile {
      margin-bottom: 10px;
    }
    .link {
      padding: 6px 10px;
      gap: 6px;
    }
    .link-icon {
      width: 18px;
      height: 18px;
    }
    .link-text {
      font-size: 12px;
    }
    .main-content {
      gap: 5px;
      margin-bottom: 8px;
    }
    .footer {
      padding: 6px 0;
      font-size: 9px;
    }
    ",
  )
}

fn desktop_styles() -> String {
  media_min_width(
    breakpoint_desktop,
    "
    .container {
      max-width: 420px;
      padding: 20px 20px 15px;
    }
    .avatar {
      width: 110px;
      height: 110px;
      margin-bottom: 10px;
      box-shadow: 4px 4px 0 " <> ink_black <> ";
    }
    .profile {
      margin-bottom: 16px;
    }
    .profile-name {
      font-size: 40px;
    }
    .profile-bio {
      font-size: 16px;
      max-width: 350px;
    }
    .link {
      padding: 10px 14px;
      gap: 12px;
      box-shadow: 4px 4px 0 " <> ink_black <> ";
    }
    .link-hover {
      transform: translate(2px, 2px);
      box-shadow: 2px 2px 0 " <> ink_black <> ";
    }
    .link-icon {
      width: 26px;
      height: 26px;
    }
    .link-text {
      font-size: 18px;
    }
    .main-content {
      gap: 10px;
      margin-bottom: 12px;
    }
    .footer {
      padding: 10px 0;
      font-size: 16px;
    }
    ",
  )
}
