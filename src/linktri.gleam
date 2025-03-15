import gleam/int
import gleam/list
import gleam/option.{type Option, None, Some}
import gleam/string
import lustre
import lustre/attribute
import lustre/element.{type Element}
import lustre/element/html

// COLORS
const pixel_dark = "#1a1b26"

const pixel_accent = "#7aa2f7"

const pixel_text = "#c0caf5"

const pixel_muted = "#A5AECF"

const pixel_highlight = "#c8a8ff"

const pixel_font = "'Press Start 2P', cursive"

const body_font = "'JetBrains Mono', monospace"

fn description() -> String {
  string.join(
    [
      "Software Engineer", "Tech Enthusiast", "Metalhead",
      "Wannabe Pixel Artist",
    ],
    with: " </> ",
  )
}

@external(javascript, "./date.mjs", "getCurrentYear")
fn get_current_year() -> Int

const full_name = "Julio Cabrera"

fn start_year() -> String {
  int.to_string(2024)
}

fn footer_content() -> String {
  "© "
  <> start_year()
  <> "-"
  <> int.to_string(get_current_year())
  <> " ~ "
  <> full_name
  <> " (Jules)"
}

// GRADIENTS
fn background_gradient() -> String {
  "linear-gradient(0deg, "
  <> pixel_dark
  <> " 0%, "
  <> pixel_dark
  <> " 25%, "
  <> pixel_dark
  <> " 50%, "
  <> pixel_accent
  <> " 100%)"
}

pub fn main() {
  let app = lustre.simple(init, update, view)
  let assert Ok(_) = lustre.start(app, "#app", Nil)
}

// MODEL

pub type Link {
  Link(title: String, url: String)
}

pub type Model {
  Model(links: List(Link), hover_link: Option(String))
}

fn init(_flags) -> #(Model, Nil) {
  let links = [
    Link("Portfolio", "https://juleskab.lat"),
    Link("Blog", "https://blog.juleskab.lat"),
    Link("LinkedIn", "https://www.linkedin.com/in/julio-cabrera-820"),
    Link("X ~ Twitter", "https://twitter.com/arielcabrera_11"),
    Link("GitHub", "https://github.com/juliocabrera820"),
    Link("Pinterest", "https://mx.pinterest.com/juliocabrera820"),
  ]
  #(Model(links: links, hover_link: None), Nil)
}

// UPDATE

pub type Msg {
  MouseEnter(String)
  MouseLeave
}

fn update(model: #(Model, Nil), msg: Msg) -> #(Model, Nil) {
  case msg {
    MouseEnter(url) -> #(Model(..model.0, hover_link: Some(url)), Nil)
    MouseLeave -> #(Model(..model.0, hover_link: None), Nil)
  }
}

// VIEW

fn font_face_styles() -> String {
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
  }"
}

fn root_styles() -> List(#(String, String)) {
  [
    #("padding", "0"),
    #("margin", "0"),
    #("min-height", "100vh"),
    #("width", "100%"),
    #("background", background_gradient()),
    #("background-attachment", "fixed"),
    #("background-size", "cover"),
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

fn container_styles() -> List(#(String, String)) {
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

fn profile_styles() -> List(#(String, String)) {
  [
    #("display", "flex"),
    #("flex-direction", "column"),
    #("align-items", "center"),
    #("margin-bottom", "18px"),
    #("text-align", "center"),
  ]
}

fn avatar_styles() -> List(#(String, String)) {
  [
    #("width", "96px"),
    #("height", "96px"),
    #("border-radius", "50%"),
    #("margin-bottom", "28px"),
    #("border", "3px solid " <> pixel_text),
    #("object-fit", "cover"),
  ]
}

fn name_styles() -> List(#(String, String)) {
  [
    #("font-size", "26px"),
    #("font-weight", "600"),
    #("margin", "0 0 8px 0"),
    #("color", pixel_text),
    #("font-family", pixel_font),
    #("letter-spacing", "1px"),
  ]
}

fn bio_styles() -> List(#(String, String)) {
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

fn main_content_styles() -> List(#(String, String)) {
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

fn link_styles(is_hover: Bool) -> List(#(String, String)) {
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
    #("border", "2px solid " <> pixel_accent),
    #("transition", "all 0.3s ease"),
    #("box-shadow", "0 2px 4px rgba(0, 0, 0, 0.1)"),
    #("cursor", "pointer"),
    #("font-family", pixel_font),
  ]

  case is_hover {
    True -> [
      #("transform", "translateY(-3px)"),
      #("box-shadow", "0 5px 15px rgba(0, 0, 0, 0.2)"),
      #("border-color", pixel_highlight),
      #("background-color", pixel_accent),
      #("color", pixel_dark),
      ..base_styles
    ]
    False -> base_styles
  }
}

fn footer_styles() -> List(#(String, String)) {
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

fn view(model_tuple: #(Model, Nil)) -> Element(Msg) {
  let model = model_tuple.0
  let font_styles = html.style([], font_face_styles())

  let profile =
    html.div([attribute.style(profile_styles())], [
      html.img([
        attribute.src("/priv/static/images/avatar.webp"),
        attribute.alt(full_name),
        attribute.style(avatar_styles()),
      ]),
      html.h1([attribute.style(name_styles())], [html.text(full_name)]),
      html.p([attribute.style(bio_styles())], [html.text(description())]),
    ])

  let link_elements =
    list.map(model.links, fn(link: Link) -> Element(Msg) {
      let is_hover = case model.hover_link {
        Some(url) if url == link.url -> True
        _ -> False
      }

      html.a(
        [
          attribute.href(link.url),
          attribute.target("_blank"),
          attribute.rel("noopener noreferrer"),
          attribute.style(link_styles(is_hover)),
          attribute.on("mouseenter", fn(_) { Ok(MouseEnter(link.url)) }),
          attribute.on("mouseleave", fn(_) { Ok(MouseLeave) }),
        ],
        [html.text(link.title)],
      )
    })

  let footer =
    html.footer([attribute.style(footer_styles())], [
      html.text(footer_content()),
    ])

  html.div([attribute.style(root_styles())], [
    font_styles,
    html.div([attribute.style(container_styles())], [
      profile,
      html.div([attribute.style(main_content_styles())], link_elements),
      footer,
    ]),
  ])
}
