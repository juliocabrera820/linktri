// COLORS
const pixel_dark = "#1a1b26"

const pixel_accent = "#7aa2f7"

const pixel_text = "#c0caf5"

const pixel_muted = "#A5AECF"

const pixel_highlight = "#c8a8ff"

// FONTS
const pixel_font = "'Press Start 2P', cursive"

const body_font = "'JetBrains Mono', monospace"

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

// GRADIENTS
fn background_gradient() -> String {
  "linear-gradient(135deg, "
  <> pixel_dark
  <> " 0%, "
  <> "#2a2c3e"
  <> " 25%, "
  <> pixel_dark
  <> " 50%, "
  <> "#2a2c3e"
  <> " 75%, "
  <> pixel_dark
  <> " 100%)"
}

// ANIMATIONS
pub fn wave_animation_keyframes() -> String {
  "@keyframes waveAnimation {
    0% {
      background-position: 0% 50%;
    }
    50% {
      background-position: 100% 50%;
    }
    100% {
      background-position: 0% 50%;
    }
  }
  @keyframes bgWaveAnimation {
    0% {
      background-position: 0% 0%;
    }
    50% {
      background-position: 100% 100%;
    }
    100% {
      background-position: 0% 0%;
    }
  }"
}

pub fn link_wave_border() -> String {
  "linear-gradient(90deg, "
  <> pixel_accent
  <> " 0%, "
  <> pixel_highlight
  <> " 25%, "
  <> pixel_accent
  <> " 50%, "
  <> pixel_highlight
  <> " 75%, "
  <> pixel_accent
  <> " 100%)"
}

// STYLES
pub fn general_styles() -> String {
  "@font-face {
    font-family: 'Press Start 2P';
    font-style: normal;
    font-weight: 400;
    font-display: swap;
    src: url('/priv/static/fonts/PressStart2P.woff2') format('woff2');
  }
  @font-face {
    font-family: 'JetBrains Mono';
    font-style: normal;
    font-weight: 400;
    font-display: swap;
    src: url('/priv/static/fonts/JetBrainsMono.woff2') format('woff2');
  }
  @font-face {
    font-family: 'JetBrains Mono';
    font-style: normal;
    font-weight: 600;
    font-display: swap;
    src: url('/priv/static/fonts/JetBrainsMono.woff2') format('woff2');
  }
  " <> wave_animation_keyframes() <> "
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
    width: 100%;
    background: " <> background_gradient() <> ";
    background-size: 300% 300%;
    background-attachment: fixed;
    animation: bgWaveAnimation 12s ease infinite;
    color: " <> pixel_text <> ";
    display: flex;
    flex-direction: column;
    align-items: center;
    font-family: " <> body_font <> ";
    box-sizing: border-box;
    -webkit-font-smoothing: antialiased;
    position: absolute;
    left: 0;
    top: 0;
    right: 0;
    bottom: 0;
    overflow-y: auto;
    -webkit-overflow-scrolling: touch;
  }
  
  .container {
    max-width: 680px;
    width: 85%;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: space-between;
    padding: 40px 20px;
    height: 100%;
    margin: 0 auto;
    background: transparent;
  }
  
  .profile {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-bottom: 18px;
    text-align: center;
    width: 100%;
  }
  
  .avatar {
    width: 96px;
    height: 96px;
    border-radius: 50%;
    margin-bottom: 28px;
    border: 3px solid transparent;
    background-origin: border-box;
    background-clip: padding-box, border-box;
    background-image: linear-gradient(#ffffff, #ffffff), " <> link_wave_border() <> ";
    background-size: calc(100% - 6px) calc(100% - 6px), 200% 200%;
    animation: waveAnimation 3s ease infinite;
    object-fit: cover;
  }
  
  .profile-name {
    font-size: 26px;
    font-weight: 600;
    margin: 0 0 8px 0;
    color: " <> pixel_text <> ";
    font-family: " <> pixel_font <> ";
    letter-spacing: 1px;
  }
  
  .profile-bio {
    font-size: 17px;
    font-weight: 600;
    margin: 0 0 18px 0;
    color: " <> pixel_muted <> ";
    max-width: 460px;
    line-height: 1.5;
    letter-spacing: 0.5px;
  }
  
  .main-content {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 16px;
    width: 100%;
    flex: 1;
    margin-bottom: 18px;
  }
  
  .link {
    display: block;
    width: 100%;
    padding: 14px 0;
    background-color: " <> pixel_dark <> ";
    color: " <> pixel_text <> ";
    text-decoration: none;
    border-radius: 8px;
    font-size: 14px;
    font-weight: 600;
    text-align: center;
    transition: all 0.3s ease;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    cursor: pointer;
    font-family: " <> pixel_font <> ";
    position: relative;
    border: 2px solid " <> pixel_accent <> ";
  }
  
  .link-hover {
    transform: translateY(-3px);
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
    color: " <> pixel_highlight <> ";
    border: none;
    background-origin: border-box;
    background-clip: padding-box, border-box;
    background-image: linear-gradient(" <> pixel_dark <> ", " <> pixel_dark <> "), " <> link_wave_border() <> ";
    background-size: 100% 100%, 200% 200%;
    border-radius: 12px;
    padding: 14px 0;
    animation: waveAnimation 2s ease infinite;
    border: 4px solid transparent;
  }
  
  .footer {
    text-align: center;
    padding: 20px 0;
    color: " <> pixel_muted <> ";
    font-size: 14px;
    font-weight: 500;
    width: 100%;
    background: transparent;
    margin-top: auto;
  }
  "
}

fn tablet_styles() -> String {
  media_max_width(
    breakpoint_tablet,
    "
    .container {
      width: 92%;
      padding: 35px 15px;
    }
    .profile-name {
      font-size: 22px;
    }
    .profile-bio {
      font-size: 15px;
      max-width: 90%;
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
      padding: 30px 15px;
    }
    .profile-name {
      font-size: 20px;
    }
    .profile-bio {
      font-size: 14px;
      margin: 0 0 15px 0;
      max-width: 95%;
    }
    .avatar {
      width: 85px;
      height: 85px;
      margin-bottom: 24px;
    }
    .link {
      padding: 12px 0;
      font-size: 13px;
    }
    .link-hover {
      padding: 12px 0;
    }
    .footer {
      padding: 15px 0;
      font-size: 13px;
    }
    ",
  )
}

fn small_mobile_styles() -> String {
  media_max_width(
    breakpoint_small_mobile,
    "
    .container {
      padding: 25px 10px;
    }
    .profile-name {
      font-size: 18px;
    }
    .profile-bio {
      font-size: 12px;
      margin: 0 0 12px 0;
    }
    .avatar {
      width: 75px;
      height: 75px;
      margin-bottom: 20px;
    }
    .link {
      padding: 10px 0;
      font-size: 11px;
    }
    .link-hover {
      padding: 10px 0;
    }
    .main-content {
      gap: 12px;
    }
    .footer {
      padding: 12px 0;
      font-size: 11px;
    }
    ",
  )
}

fn desktop_styles() -> String {
  media_min_width(
    breakpoint_desktop,
    "
    .container {
      max-width: 760px;
    }
    .profile-name {
      font-size: 28px;
    }
    .profile-bio {
      font-size: 18px;
      max-width: 500px;
    }
    .avatar {
      width: 110px;
      height: 110px;
    }
    .link {
      font-size: 15px;
    }
    ",
  )
}
