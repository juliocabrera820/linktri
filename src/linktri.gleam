import gleam/int
import gleam/list
import gleam/option.{type Option, None, Some}
import gleam/string
import lustre
import lustre/attribute
import lustre/element.{type Element}
import lustre/element/html
import styles.{general_styles}

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

fn view(model_tuple: #(Model, Nil)) -> Element(Msg) {
  let model = model_tuple.0

  let font_styles = html.style([], general_styles())

  let profile =
    html.div([attribute.class("profile")], [
      html.img([
        attribute.src("/priv/static/images/avatar.webp"),
        attribute.alt(full_name),
        attribute.class("avatar"),
      ]),
      html.h1([attribute.class("profile-name")], [html.text(full_name)]),
      html.p([attribute.class("profile-bio")], [html.text(description())]),
    ])

  let link_elements =
    list.map(model.links, fn(link: Link) -> Element(Msg) {
      let is_hover = case model.hover_link {
        Some(url) if url == link.url -> True
        _ -> False
      }

      let link_class = case is_hover {
        True -> "link link-hover"
        False -> "link"
      }

      html.a(
        [
          attribute.href(link.url),
          attribute.target("_blank"),
          attribute.rel("noopener noreferrer"),
          attribute.class(link_class),
          attribute.on("mouseenter", fn(_) { Ok(MouseEnter(link.url)) }),
          attribute.on("mouseleave", fn(_) { Ok(MouseLeave) }),
        ],
        [html.text(link.title)],
      )
    })

  let footer =
    html.footer([attribute.class("footer")], [html.text(footer_content())])

  html.div([attribute.class("root")], [
    font_styles,
    html.div([attribute.class("container")], [
      profile,
      html.div([attribute.class("main-content")], link_elements),
      footer,
    ]),
  ])
}
