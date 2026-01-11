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

@external(javascript, "./routing.mjs", "getPath")
fn get_path() -> String

const full_name = "Julio Cabrera"

pub type Route {
  Home
  NotFound
}

fn get_route() -> Route {
  case get_path() {
    "/" -> Home
    _ -> NotFound
  }
}

fn start_year() -> String {
  int.to_string(2024)
}

fn footer_content() -> String {
  "© "
  <> start_year()
  <> "-"
  <> int.to_string(get_current_year())
  <> " ~ "
  <> " Juleskab"
}

pub fn main() {
  let app = lustre.simple(init, update, view)
  let assert Ok(_) = lustre.start(app, "#app", Nil)
}

// MODEL

pub type LinkType {
  GitHub
  LinkedIn
  Portfolio
  Twitter
  Blog
  Email
}

pub type Link {
  Link(title: String, url: String, link_type: LinkType, display_name: String)
}

pub type Model {
  Model(
    social_links: List(Link), 
    work_links: List(Link),
    hover_link: Option(String), 
    route: Route
  )
}

fn init(_flags) -> #(Model, Nil) {
  let social_links = [
    Link("Email", "mailto:hello@juleskab.lat", Email, "hello@juleskab.lat"),
    Link("LinkedIn", "https://www.linkedin.com/in/julio-cabrera-820", LinkedIn, "julio cabrera"),
    Link("X", "https://twitter.com/arielcabrera_11", Twitter, "arielcabrera_11"),
  ]
  let work_links = [
    Link("GitHub", "https://github.com/juliocabrera820", GitHub, "juliocabrera820"),
    Link("Portfolio", "https://juleskab.lat", Portfolio, "Portfolio"),
    Link("Blog", "https://blog.juleskab.lat", Blog, "Blog"),
  ]
  #(Model(social_links: social_links, work_links: work_links, hover_link: None, route: get_route()), Nil)
}

// UPDATE

pub type Msg {
  MouseEnter(String)
  MouseLeave
  NavigateTo(Route)
}

fn update(model: #(Model, Nil), msg: Msg) -> #(Model, Nil) {
  case msg {
    MouseEnter(url) -> #(Model(..model.0, hover_link: Some(url)), Nil)
    MouseLeave -> #(Model(..model.0, hover_link: None), Nil)
    NavigateTo(route) -> #(Model(..model.0, route: route), Nil)
  }
}

// ICONS - Using CSS classes with background images

fn get_icon_class(link_type: LinkType) -> String {
  case link_type {
    GitHub -> "link-icon link-icon-github"
    LinkedIn -> "link-icon link-icon-linkedin"
    Portfolio -> "link-icon link-icon-portfolio"
    Twitter -> "link-icon link-icon-twitter"
    Blog -> "link-icon link-icon-blog"
    Email -> "link-icon link-icon-email"
  }
}

// VIEW

fn view(model_tuple: #(Model, Nil)) -> Element(Msg) {
  let model = model_tuple.0

  let font_styles = html.style([], general_styles())

  let content = case model.route {
    Home -> view_home(model)
    NotFound -> view_404()
  }

  html.div([attribute.class("root")], [
    font_styles,
    html.div([attribute.class("container")], [content]),
  ])
}

fn view_404() -> Element(Msg) {
  html.div([attribute.class("error-page")], [
    // Skateboard icon animation
    html.div([attribute.class("error-skateboard")], [
      html.span([attribute.class("skateboard-emoji")], [html.text("🛹")])
    ]),
    // Error code with glitch effect
    html.h1([attribute.class("error-code")], [html.text("404")]),
    // Main message
    html.p([attribute.class("error-title")], [
      html.text("You went off the wall!")
    ]),
    // Subtitle
    html.p([attribute.class("error-subtitle")], [
      html.text("Looks like this page bailed on you...")
    ]),
    // Fun skateboarding terms
    html.div([attribute.class("error-tips")], [
      html.p([attribute.class("error-tip")], [
        html.text("Maybe try a different trick? 🤙")
      ])
    ]),
    // Back button with style
    html.a([attribute.href("/"), attribute.class("error-button")], [
      html.span([attribute.class("error-button-icon")], [html.text("←")]),
      html.span([attribute.class("error-button-text")], [html.text("Back to the ramp")])
    ])
  ])
}

fn view_home(model: Model) -> Element(Msg) {
  // Profile card with avatar, name, bio and status
  let profile_card =
    html.div([attribute.class("profile-card")], [
      html.div([attribute.class("profile")], [
        // Avatar with decorative ring
        html.div([attribute.class("avatar-wrapper")], [
          html.div([attribute.class("avatar-ring")], []),
          html.img([
            attribute.src("/priv/static/images/avatar.webp"),
            attribute.alt(full_name),
            attribute.class("avatar"),
          ]),
        ]),
        html.h1([attribute.class("profile-name")], [html.text(full_name)]),
        html.p([attribute.class("profile-bio")], [html.text(description())]),
        // Status badge
        html.div([attribute.class("status-badge")], [
          html.span([attribute.class("status-dot")], []),
          html.span([], [html.text("Available for work")])
        ])
      ])
    ])

  // Section title for social links
  let social_section_title =
    html.div([attribute.class("section-title")], [
      html.span([attribute.class("section-title-line")], []),
      html.span([attribute.class("section-title-text")], [html.text("Connect with me")]),
      html.span([attribute.class("section-title-line")], [])
    ])

  let social_link_elements =
    list.map(model.social_links, render_link(model.hover_link, _))

  // Section title for work links
  let work_section_title =
    html.div([attribute.class("section-title section-title-work")], [
      html.span([attribute.class("section-title-line")], []),
      html.span([attribute.class("section-title-text")], [html.text("My work")]),
      html.span([attribute.class("section-title-line")], [])
    ])

  let work_link_elements =
    list.map(model.work_links, render_link(model.hover_link, _))

  let footer = html.footer([attribute.class("footer")], [
    html.div([attribute.class("footer-text")], [
      html.text(footer_content()),
      html.span([attribute.class("footer-heart")], [html.text(" ♥")])
    ])
  ])

  html.div([], [
    profile_card, 
    social_section_title,
    html.div([attribute.class("main-content")], social_link_elements),
    work_section_title,
    html.div([attribute.class("main-content")], work_link_elements),
    footer
  ])
}

// --- RENDER HELPERS ---

fn render_link(hover_link: Option(String), link: Link) -> Element(Msg) {
  let is_hover = case hover_link {
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
    [
      html.span([attribute.class(get_icon_class(link.link_type))], []),
      html.span([attribute.class("link-text")], [html.text(link.display_name)]),
    ],
  )
}