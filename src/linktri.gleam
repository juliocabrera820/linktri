import gleam/float
import gleam/int
import gleam/list
import gleam/option.{type Option, None, Some}
import lustre
import lustre/attribute
import lustre/effect.{type Effect}
import lustre/element.{type Element}
import lustre/element/html
import lustre/element/svg
import lustre/event
import ui
import vans_styles.{vans_styles}

// ── External JS ────────────────────────────────────────────────────────────

@external(javascript, "./date.mjs", "getCurrentYear")
fn get_current_year() -> Int

@external(javascript, "./routing.mjs", "getPath")
fn get_path() -> String

@external(javascript, "./effects.mjs", "setupCursorEffect")
fn do_setup_cursor_effect(
  on_loaded: fn() -> Nil,
  on_mouse_moved: fn(Float, Float) -> Nil,
) -> Nil

@external(javascript, "./effects.mjs", "bindEscape")
fn bind_escape(on_escape: fn() -> Nil) -> Nil

@external(javascript, "./effects.mjs", "unbindEscape")
fn unbind_escape() -> Nil

@external(javascript, "./effects.mjs", "setupScrollParallax")
fn do_setup_scroll_parallax(on_scrolled: fn(Float) -> Nil) -> Nil

// ── Routing ─────────────────────────────────────────────────────────────────

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

// ── Types ───────────────────────────────────────────────────────────────────

pub type LinkType {
  Email
  LinkedIn
  Twitter
  Portfolio
  Blog
  ThreeDPrinting
}

pub type Link {
  Link(label: String, sub: String, href: String, link_type: LinkType)
}

pub type LinkGroup {
  LinkGroup(label: String, items: List(Link))
}

pub type Model {
  Model(
    link_groups: List(LinkGroup),
    loaded: Bool,
    mouse_x: Float,
    mouse_y: Float,
    scroll_t: Float,
    route: Route,
    popup_message: Option(String),
  )
}

pub type Msg {
  Loaded
  MouseMoved(Float, Float)
  Scrolled(Float)
  ShowPopup(String)
  HidePopup
}

// ── Init ────────────────────────────────────────────────────────────────────

fn init(_flags) -> #(Model, Effect(Msg)) {
  let link_groups = [
    LinkGroup("Contact", [
      Link(
        "Personal Email",
        "hello@juleskab.lat",
        "mailto:hello@juleskab.lat",
        Email,
      ),
    ]),
    LinkGroup("Social Networks", [
      Link(
        "LinkedIn",
        "linkedin.com/in/julio-cabrera-820",
        "https://www.linkedin.com/in/julio-cabrera-820",
        LinkedIn,
      ),
      Link(
        "Twitter / X",
        "@arielcabrera_11",
        "https://twitter.com/arielcabrera_11",
        Twitter,
      ),
    ]),
    LinkGroup("Projects", [
      Link("Portfolio", "juleskab.lat", "https://juleskab.lat", Portfolio),
      Link("Blog", "blog.juleskab.lat", "https://blog.juleskab.lat", Blog),
    ]),
    LinkGroup("Ventures", [
      Link(
        "3D Printing",
        "Custom prints & prototypes",
        "#",
        ThreeDPrinting,
      ),
    ]),
  ]
  #(
    Model(
      link_groups: link_groups,
      loaded: False,
      mouse_x: 0.5,
      mouse_y: 0.5,
      scroll_t: 0.0,
      route: get_route(),
      popup_message: None,
    ),
    effect.from(fn(dispatch) {
      do_setup_cursor_effect(
        fn() { dispatch(Loaded) },
        fn(x, y) { dispatch(MouseMoved(x, y)) },
      )
      do_setup_scroll_parallax(fn(t) { dispatch(Scrolled(t)) })
    }),
  )
}

// ── Update ──────────────────────────────────────────────────────────────────

pub fn main() {
  let app = lustre.application(init, update, view)
  let assert Ok(_) = lustre.start(app, "#app", Nil)
}

fn update(model: Model, msg: Msg) -> #(Model, Effect(Msg)) {
  case msg {
    Loaded -> #(Model(..model, loaded: True), effect.none())
    MouseMoved(x, y) ->
      #(Model(..model, mouse_x: x, mouse_y: y), effect.none())
    Scrolled(t) -> #(Model(..model, scroll_t: t), effect.none())
    ShowPopup(message) -> #(
      Model(..model, popup_message: Some(message)),
      effect.from(fn(dispatch) { bind_escape(fn() { dispatch(HidePopup) }) }),
    )
    HidePopup -> #(
      Model(..model, popup_message: None),
      effect.from(fn(_) { unbind_escape() }),
    )
  }
}

// ── Icon mapping ─────────────────────────────────────────────────────────────

fn get_icon(link_type: LinkType) -> Element(Msg) {
  case link_type {
    Email -> ui.icon_mail()
    LinkedIn -> ui.icon_linkedin()
    Twitter -> ui.icon_twitter()
    Portfolio -> ui.icon_portfolio()
    Blog -> ui.icon_blog()
    ThreeDPrinting -> ui.icon_3d_printing()
  }
}

// ── View ─────────────────────────────────────────────────────────────────────

fn view(model: Model) -> Element(Msg) {
  let content = case model.route {
    Home -> view_home(model)
    NotFound -> view_404()
  }

  html.div([], [html.style([], vans_styles()), content])
}

// ── 404 ──────────────────────────────────────────────────────────────────────

fn view_404() -> Element(Msg) {
  html.div([attribute.class("error-page")], [
    html.div([attribute.class("error-skateboard")], [
      html.span([attribute.class("skateboard-emoji")], [html.text("🛹")]),
    ]),
    html.h1([attribute.class("error-code")], [html.text("404")]),
    html.p([attribute.class("error-title")], [
      html.text("You went off the wall!"),
    ]),
    html.p([attribute.class("error-subtitle")], [
      html.text("Looks like this page bailed on you..."),
    ]),
    html.div([attribute.class("error-tips")], [
      html.p([attribute.class("error-tip")], [
        html.text("Maybe try a different trick? 🤙"),
      ]),
    ]),
    html.a([attribute.href("/"), attribute.class("error-button")], [
      html.span([attribute.class("error-button-icon")], [html.text("←")]),
      html.span([attribute.class("error-button-text")], [
        html.text("Back to the ramp"),
      ]),
    ]),
  ])
}

// ── Home ─────────────────────────────────────────────────────────────────────

const parallax_scroll_px = 200.0

fn view_home(model: Model) -> Element(Msg) {
  let plx_x = { model.mouse_x -. 0.5 } *. 24.0
  let plx_y = { model.mouse_y -. 0.5 } *. 18.0
  let plx_s = model.scroll_t *. parallax_scroll_px

  let num_groups = list.length(model.link_groups)

  html.div([], [
    // Checkerboard corners
    view_checker_tl(),
    view_checker_br(),
    // Rotated side label
    html.div([attribute.class("side-label")], [
      html.text("OFF THE WALL — SINCE 1966"),
    ]),
    // Scrolling bottom marquee
    view_marquee(),
    // Popup overlay
    case model.popup_message {
      Some(message) -> view_popup(message)
      None -> element.none()
    },
    // Main page content
    html.div([attribute.class("page")], [
      view_parallax_bg(plx_x, plx_y, plx_s),
      html.div(
        [attribute.class("card")],
        list.flatten([
          [
            view_avatar(model.loaded),
            view_name_block(model.loaded),
            html.div([attribute.class("divider")], []),
          ],
          list.flatten(
            list.index_map(model.link_groups, fn(group, gi) {
              view_link_group(group, gi, num_groups, model.loaded)
            }),
          ),
          [view_footer_tag(model.loaded)],
        ]),
      ),
    ]),
  ])
}

fn view_avatar(loaded: Bool) -> Element(Msg) {
  let wrap_class = case loaded {
    True -> "avatar-wrap visible"
    False -> "avatar-wrap"
  }
  html.div([attribute.class(wrap_class)], [
    html.div([attribute.class("avatar-ring")], [
      html.img([attribute.src("/priv/static/images/avatar.png"), attribute.alt("Jules Kab"), attribute.class("avatar-placeholder")])
    ]),
    html.div([attribute.class("avatar-badge")], [
      svg.svg(
        [
          attribute.attribute("viewBox", "0 0 12 12"),
          attribute.attribute("fill", "none"),
          attribute.attribute("xmlns", "http://www.w3.org/2000/svg"),
        ],
        [
          svg.path([
            attribute.attribute("d", "M2 6h8M6 2l4 4-4 4"),
            attribute.attribute("stroke", "currentColor"),
            attribute.attribute("stroke-width", "1.5"),
            attribute.attribute("stroke-linecap", "round"),
            attribute.attribute("stroke-linejoin", "round"),
          ]),
        ],
      ),
    ]),
  ])
}

fn view_name_block(loaded: Bool) -> Element(Msg) {
  let block_class = case loaded {
    True -> "name-block visible"
    False -> "name-block"
  }
  html.div([attribute.class(block_class)], [
    html.div([attribute.class("name")], [
      html.text("JULES"),
      html.span([attribute.class("name-accent")], [html.text("KAB")]),
    ]),
    html.div([attribute.class("otw-tag")], [
      html.text("\"OFF THE WALL, ON THE KEYBOARD\""),
    ]),
  ])
}

fn view_footer_tag(loaded: Bool) -> Element(Msg) {
  let footer_class = case loaded {
    True -> "footer-tag visible"
    False -> "footer-tag"
  }
  html.div([attribute.class(footer_class)], [
    html.text(
      "JULESKAB · ON THE KEYBOARD · ©2024-"
      <> int.to_string(get_current_year()),
    ),
  ])
}

fn view_popup(message: String) -> Element(Msg) {
  html.div(
    [
      attribute.class("popup-overlay"),
      attribute.on("click", fn(_event) { Ok(HidePopup) }),
    ],
    [
      html.div(
        [
          attribute.class("popup-content"),
          attribute.role("dialog"),
          attribute.attribute("aria-modal", "true"),
          attribute.attribute("aria-labelledby", "popup-title"),
          attribute.attribute("aria-describedby", "popup-message"),
          event.on("click", fn(e) {
            let _ = event.stop_propagation(e)
            Error([])
          }),
        ],
        [
          html.div([attribute.class("popup-icon")], [ui.icon_hourglass()]),
          html.p(
            [attribute.class("popup-eyebrow"), attribute.id("popup-title")],
            [html.text("In progress")],
          ),
          html.p(
            [
              attribute.class("popup-message"),
              attribute.id("popup-message"),
            ],
            [html.text(message)],
          ),
          html.button(
            [
              attribute.class("popup-close"),
              attribute.autofocus(True),
              attribute.on("click", fn(_event) { Ok(HidePopup) }),
            ],
            [html.text("Close")],
          ),
        ],
      ),
    ],
  )
}

fn view_link_group(
  group: LinkGroup,
  group_idx: Int,
  total_groups: Int,
  loaded: Bool,
) -> List(Element(Msg)) {
  let label_class = case loaded {
    True -> "section-label visible"
    False -> "section-label"
  }
  let label_delay =
    float.to_string(0.4 +. int.to_float(group_idx) *. 0.12) <> "s"

  let items =
    list.index_map(group.items, fn(link, item_idx) {
      let delay =
        0.5
        +. int.to_float(group_idx)
        *. 0.12
        +. int.to_float(item_idx)
        *. 0.09
      
      case link.link_type {
        ThreeDPrinting -> {
          ui.link_item_with_click_and_class(
            link.label,
            link.sub,
            link.href,
            get_icon(link.link_type),
            loaded,
            float.to_string(delay) <> "s",
            Some(fn() { ShowPopup("Project in development - Coming soon") }),
            Some("in-progress"),
          )
        }
        _ -> {
          ui.link_item(
            link.label,
            link.sub,
            link.href,
            get_icon(link.link_type),
            loaded,
            float.to_string(delay) <> "s",
          )
        }
      }
    })

  let divider = case group_idx < total_groups - 1 {
    True ->
      html.div(
        [
          attribute.class("divider"),
          attribute.style([#("margin-bottom", "12px")]),
        ],
        [],
      )
    False -> element.none()
  }

  [
    html.div(
      [
        attribute.class(label_class),
        attribute.style([#("transition-delay", label_delay)]),
      ],
      [html.text("— " <> group.label)],
    ),
    html.div([attribute.class("links-group")], items),
    divider,
  ]
}

// ── Parallax background decoratives ──────────────────────────────────────────

fn css_px(value: Float) -> String {
  float.to_string(value) <> "px"
}

fn view_parallax_bg(plx_x: Float, plx_y: Float, plx_s: Float) -> Element(Msg) {
  html.div(
    [
      attribute.class("parallax-bg"),
      attribute.style([
        #("--plx-x", css_px(plx_x)),
        #("--plx-y", css_px(plx_y)),
        #("--plx-s", css_px(plx_s)),
      ]),
    ],
    [
      html.div([attribute.class("plax-layer plax-layer--mid")], [
        html.div([attribute.class("blob blob--a")], []),
        html.div([attribute.class("blob blob--b")], []),
        html.div([attribute.class("blob blob--c")], []),
      ]),
      html.div([attribute.class("plax-layer plax-layer--far")], [
        html.div([attribute.class("bg-word bg-word--off")], [html.text("OFF")]),
        html.div([attribute.class("bg-word bg-word--wall")], [
          html.text("WALL"),
        ]),
        html.div([attribute.class("bg-word bg-word--since")], [
          html.text("SINCE 1966"),
        ]),
      ]),
      html.div([attribute.class("plax-layer plax-layer--near")], [
        html.div([attribute.class("bg-strip bg-strip--a")], []),
        html.div([attribute.class("bg-strip bg-strip--b")], []),
        html.div([attribute.class("geo-bar geo-bar--a")], []),
        html.div([attribute.class("geo-bar geo-bar--b")], []),
        html.div([attribute.class("geo-bar geo-bar--c")], []),
        view_skate_deck("bg-deck--a"),
        view_skate_deck("bg-deck--b"),
        view_plus_mark("bg-plus--a"),
        view_plus_mark("bg-plus--b"),
      ]),
    ],
  )
}

fn view_skate_deck(variant: String) -> Element(Msg) {
  svg.svg(
    [
      attribute.class("bg-deco bg-deck " <> variant),
      attribute.attribute("viewBox", "0 0 44 96"),
    ],
    [
      svg.rect([
        attribute.attribute("x", "4"),
        attribute.attribute("y", "16"),
        attribute.attribute("width", "36"),
        attribute.attribute("height", "64"),
        attribute.attribute("rx", "18"),
        attribute.attribute("fill", "none"),
        attribute.attribute("stroke", "currentColor"),
        attribute.attribute("stroke-width", "2.5"),
      ]),
      svg.circle([
        attribute.attribute("cx", "11"),
        attribute.attribute("cy", "8"),
        attribute.attribute("r", "5.5"),
        attribute.attribute("fill", "none"),
        attribute.attribute("stroke", "currentColor"),
        attribute.attribute("stroke-width", "2"),
      ]),
      svg.circle([
        attribute.attribute("cx", "33"),
        attribute.attribute("cy", "8"),
        attribute.attribute("r", "5.5"),
        attribute.attribute("fill", "none"),
        attribute.attribute("stroke", "currentColor"),
        attribute.attribute("stroke-width", "2"),
      ]),
      svg.circle([
        attribute.attribute("cx", "11"),
        attribute.attribute("cy", "88"),
        attribute.attribute("r", "5.5"),
        attribute.attribute("fill", "none"),
        attribute.attribute("stroke", "currentColor"),
        attribute.attribute("stroke-width", "2"),
      ]),
      svg.circle([
        attribute.attribute("cx", "33"),
        attribute.attribute("cy", "88"),
        attribute.attribute("r", "5.5"),
        attribute.attribute("fill", "none"),
        attribute.attribute("stroke", "currentColor"),
        attribute.attribute("stroke-width", "2"),
      ]),
    ],
  )
}

fn view_plus_mark(variant: String) -> Element(Msg) {
  svg.svg(
    [
      attribute.class("bg-deco bg-plus " <> variant),
      attribute.attribute("viewBox", "0 0 36 36"),
    ],
    [
      svg.line([
        attribute.attribute("x1", "18"),
        attribute.attribute("y1", "3"),
        attribute.attribute("x2", "18"),
        attribute.attribute("y2", "33"),
        attribute.attribute("stroke", "currentColor"),
        attribute.attribute("stroke-width", "4"),
        attribute.attribute("stroke-linecap", "round"),
      ]),
      svg.line([
        attribute.attribute("x1", "3"),
        attribute.attribute("y1", "18"),
        attribute.attribute("x2", "33"),
        attribute.attribute("y2", "18"),
        attribute.attribute("stroke", "currentColor"),
        attribute.attribute("stroke-width", "4"),
        attribute.attribute("stroke-linecap", "round"),
      ]),
    ],
  )
}

// ── Checker corners ───────────────────────────────────────────────────────────

fn checker_cell(x: Int, y: Int, filled: Bool) -> Element(msg) {
  svg.rect([
    attribute.attribute("x", int.to_string(x)),
    attribute.attribute("y", int.to_string(y)),
    attribute.attribute("width", "12"),
    attribute.attribute("height", "12"),
    attribute.attribute("fill", case filled {
      True -> "currentColor"
      False -> "transparent"
    }),
    attribute.attribute("opacity", case filled {
      True -> "0.12"
      False -> "0"
    }),
  ])
}

fn checker_cells(invert: Bool) -> List(Element(msg)) {
  list.flat_map([0, 1, 2], fn(row) {
    list.map([0, 1, 2], fn(col) {
      let filled = case invert {
        False -> { row + col } % 2 == 0
        True -> { row + col } % 2 == 1
      }
      checker_cell(col * 12, row * 12, filled)
    })
  })
}

fn checker_svg(invert: Bool) -> Element(msg) {
  svg.svg(
    [
      attribute.attribute("width", "72"),
      attribute.attribute("height", "72"),
      attribute.attribute("viewBox", "0 0 72 72"),
      attribute.attribute("xmlns", "http://www.w3.org/2000/svg"),
      attribute.class("checker-pattern"),
    ],
    checker_cells(invert),
  )
}

fn view_checker_tl() -> Element(Msg) {
  html.div([attribute.class("checker-tl")], [checker_svg(False)])
}

fn view_checker_br() -> Element(Msg) {
  html.div([attribute.class("checker-br")], [checker_svg(True)])
}

// ── Marquee ───────────────────────────────────────────────────────────────────

fn marquee_item(text: String) -> List(Element(Msg)) {
  [
    html.span([], [html.text(text)]),
    html.span([attribute.class("dot")], [html.text("✕")]),
  ]
}

fn view_marquee() -> Element(Msg) {
  let words = ["OFF THE WALL", "ON THE KEYBOARD", "JULESKAB", "SOFTWARE ENGINEER", "TECH ENTHUSIAST", "WANNABE PIXEL ARTIST"]
  let items = list.flatten(list.map(words, marquee_item))
  html.div([attribute.class("marquee-wrap")], [
    html.div(
      [attribute.class("marquee-track")],
      list.flatten([items, items]),
    ),
  ])
}
