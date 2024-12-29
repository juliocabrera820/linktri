import gleam/list
import lustre
import lustre/attribute
import lustre/element.{type Element}
import lustre/element/html

pub fn main() {
  let app = lustre.simple(init, update, view)
  let assert Ok(_) = lustre.start(app, "#app", Nil)
}

// MODEL

pub type Link {
  Link(title: String, url: String)
}

pub type Model {
  Model(links: List(Link))
}

fn init(_flags) -> #(Model, Nil) {
  let links = [
    Link("GitHub", "https://github.com"),
    Link("Twitter", "https://twitter.com"),
    Link("LinkedIn", "https://linkedin.com"),
  ]
  #(Model(links), Nil)
}

// UPDATE

pub type Msg {
  NoOp
}

fn update(_msg, model: #(Model, Nil)) -> #(Model, Nil) {
  model
}

// VIEW

fn styles() -> List(#(String, String)) {
  [
    #("text-align", "center"),
    #("font-family", "Arial, sans-serif"),
    #("margin-top", "50px"),
    #("background-color", "#f0f0f0"),
    #("padding", "20px"),
    #("border-radius", "10px"),
    #("box-shadow", "0 4px 8px rgba(0, 0, 0, 0.1)"),
  ]
}

fn link_styles() -> List(#(String, String)) {
  [
    #("display", "block"),
    #("margin", "10px 0"),
    #("padding", "10px 20px"),
    #("background-color", "#007bff"),
    #("color", "#ffffff"),
    #("text-decoration", "none"),
    #("border-radius", "5px"),
    #("transition", "background-color 0.3s"),
    #("text-align", "center"),
  ]
}

fn view(model: #(Model, Nil)) -> Element(#(Model, Nil)) {
  let Model(links) = model.0
  let link_elements =
    list.map(links, fn(link: Link) -> Element(#(Model, Nil)) {
      html.a(
        [
          attribute.href(link.url),
          attribute.target("_blank"),
          attribute.rel("noopener noreferrer"),
          attribute.style(link_styles()),
        ],
        [html.text(link.title)],
      )
    })
  html.div([attribute.style(styles())], link_elements)
}
