// COLORS
const pixel_dark = "#1a1b26"

const pixel_accent = "#7aa2f7"

const pixel_text = "#c0caf5"

const pixel_muted = "#A5AECF"

const pixel_highlight = "#c8a8ff"

// FONTS
const pixel_font = "'Press Start 2P', cursive"

const body_font = "'JetBrains Mono', monospace"

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
pub fn font_face_styles() -> String {
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
  " <> wave_animation_keyframes()
}

pub fn root_styles() -> List(#(String, String)) {
  [
    #("padding", "0"),
    #("margin", "0"),
    #("min-height", "100vh"),
    #("width", "100%"),
    #("background", background_gradient()),
    #("background-size", "300% 300%"),
    #("background-attachment", "fixed"),
    #("animation", "bgWaveAnimation 12s ease infinite"),
    #("color", pixel_text),
    #("display", "flex"),
    #("flex-direction", "column"),
    #("align-items", "center"),
    #("font-family", body_font),
    #("box-sizing", "border-box"),
    #("-webkit-font-smoothing", "antialiased"),
    #("position", "absolute"),
    #("left", "0"),
    #("top", "0"),
    #("right", "0"),
    #("bottom", "0"),
    #("overflow-y", "auto"),
    #("-webkit-overflow-scrolling", "touch"),
  ]
}

pub fn container_styles() -> List(#(String, String)) {
  [
    #("max-width", "680px"),
    #("width", "90%"),
    #("display", "flex"),
    #("flex-direction", "column"),
    #("align-items", "center"),
    #("justify-content", "space-between"),
    #("padding", "40px 20px"),
    #("height", "100%"),
    #("margin", "0 auto"),
    #("background", "transparent"),
  ]
}

pub fn profile_styles() -> List(#(String, String)) {
  [
    #("display", "flex"),
    #("flex-direction", "column"),
    #("align-items", "center"),
    #("margin-bottom", "18px"),
    #("text-align", "center"),
  ]
}

pub fn avatar_styles() -> List(#(String, String)) {
  [
    #("width", "96px"),
    #("height", "96px"),
    #("border-radius", "50%"),
    #("margin-bottom", "28px"),
    #("border", "3px solid " <> pixel_text),
    #("object-fit", "cover"),
  ]
}

pub fn name_styles() -> List(#(String, String)) {
  [
    #("font-size", "26px"),
    #("font-weight", "600"),
    #("margin", "0 0 8px 0"),
    #("color", pixel_text),
    #("font-family", pixel_font),
    #("letter-spacing", "1px"),
  ]
}

pub fn bio_styles() -> List(#(String, String)) {
  [
    #("font-size", "17px"),
    #("font-weight", "600"),
    #("margin", "0 0 18px 0"),
    #("color", pixel_muted),
    #("max-width", "460px"),
    #("line-height", "1.5"),
    #("letter-spacing", "0.5px"),
  ]
}

pub fn main_content_styles() -> List(#(String, String)) {
  [
    #("display", "flex"),
    #("flex-direction", "column"),
    #("align-items", "center"),
    #("gap", "16px"),
    #("width", "100%"),
    #("flex", "1"),
    #("margin-bottom", "18px"),
  ]
}

pub fn link_styles(is_hover: Bool) -> List(#(String, String)) {
  let base_styles = [
    #("display", "block"),
    #("width", "100%"),
    #("padding", "14px 0"),
    #("background-color", pixel_dark),
    #("color", pixel_text),
    #("text-decoration", "none"),
    #("border-radius", "8px"),
    #("font-size", "14px"),
    #("font-weight", "600"),
    #("text-align", "center"),
    #("transition", "all 0.3s ease"),
    #("box-shadow", "0 2px 4px rgba(0, 0, 0, 0.1)"),
    #("cursor", "pointer"),
    #("font-family", pixel_font),
    #("position", "relative"),
  ]

  case is_hover {
    True -> [
      #("transform", "translateY(-3px)"),
      #("box-shadow", "0 5px 15px rgba(0, 0, 0, 0.2)"),
      #("color", pixel_highlight),
      #("border", "none"),
      #("background-origin", "border-box"),
      #("background-clip", "padding-box, border-box"),
      #(
        "background-image",
        "linear-gradient("
          <> pixel_dark
          <> ", "
          <> pixel_dark
          <> "), "
          <> link_wave_border(),
      ),
      #("background-size", "100% 100%, 200% 200%"),
      #("border-radius", "12px"),
      #("padding", "14px 0"),
      #("animation", "waveAnimation 2s ease infinite"),
      #("border", "4px solid transparent"),
      ..base_styles
    ]
    False -> [#("border", "2px solid " <> pixel_accent), ..base_styles]
  }
}

pub fn footer_styles() -> List(#(String, String)) {
  [
    #("text-align", "center"),
    #("padding", "20px 0"),
    #("color", pixel_muted),
    #("font-size", "14px"),
    #("font-weight", "500"),
    #("width", "100%"),
    #("background", "transparent"),
    #("margin-top", "auto"),
  ]
}
