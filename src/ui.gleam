import gleam/list
import gleam/option.{type Option, None, Some}
import lustre/attribute
import lustre/element.{type Element}
import lustre/element/html
import lustre/element/svg

// ── SVG Icons ──────────────────────────────────────────────────────────────
// Each icon matches the original vans.html icon components.
// All icons are generic Element(msg) — no Lustre Msg dependency.

pub fn icon_mail() -> Element(msg) {
  svg.svg(
    [
      attribute.attribute("viewBox", "0 0 24 24"),
      attribute.attribute("fill", "none"),
      attribute.attribute("xmlns", "http://www.w3.org/2000/svg"),
    ],
    [
      svg.rect([
        attribute.attribute("x", "2"),
        attribute.attribute("y", "5"),
        attribute.attribute("width", "20"),
        attribute.attribute("height", "14"),
        attribute.attribute("rx", "2"),
        attribute.attribute("stroke", "#111"),
        attribute.attribute("stroke-width", "1.8"),
        attribute.attribute("fill", "none"),
      ]),
      svg.path([
        attribute.attribute("d", "M2 8l10 7 10-7"),
        attribute.attribute("stroke", "#111"),
        attribute.attribute("stroke-width", "1.8"),
        attribute.attribute("stroke-linecap", "round"),
      ]),
    ],
  )
}

pub fn icon_linkedin() -> Element(msg) {
  svg.svg(
    [
      attribute.attribute("viewBox", "0 0 24 24"),
      attribute.attribute("fill", "none"),
      attribute.attribute("xmlns", "http://www.w3.org/2000/svg"),
    ],
    [
      svg.path([
        attribute.attribute(
          "d",
          "M16 8a6 6 0 0 1 6 6v7h-4v-7a2 2 0 0 0-2-2 2 2 0 0 0-2 2v7h-4v-7a6 6 0 0 1 6-6z",
        ),
        attribute.attribute("fill", "#111"),
      ]),
      svg.rect([
        attribute.attribute("x", "2"),
        attribute.attribute("y", "9"),
        attribute.attribute("width", "4"),
        attribute.attribute("height", "12"),
        attribute.attribute("fill", "#111"),
      ]),
      svg.circle([
        attribute.attribute("cx", "4"),
        attribute.attribute("cy", "4"),
        attribute.attribute("r", "2"),
        attribute.attribute("fill", "#111"),
      ]),
    ],
  )
}

pub fn icon_twitter() -> Element(msg) {
  svg.svg(
    [
      attribute.attribute("viewBox", "0 0 24 24"),
      attribute.attribute("fill", "none"),
      attribute.attribute("xmlns", "http://www.w3.org/2000/svg"),
    ],
    [
      svg.path([
        attribute.attribute("d", "M4 4h5l11 16h-5z"),
        attribute.attribute("fill", "#111"),
      ]),
      svg.path([
        attribute.attribute("d", "M4 20L20 4"),
        attribute.attribute("stroke", "#111"),
        attribute.attribute("stroke-width", "2"),
        attribute.attribute("stroke-linecap", "round"),
      ]),
    ],
  )
}

pub fn icon_portfolio() -> Element(msg) {
  svg.svg(
    [
      attribute.attribute("viewBox", "0 0 24 24"),
      attribute.attribute("fill", "none"),
      attribute.attribute("xmlns", "http://www.w3.org/2000/svg"),
    ],
    [
      svg.rect([
        attribute.attribute("x", "3"),
        attribute.attribute("y", "3"),
        attribute.attribute("width", "7"),
        attribute.attribute("height", "7"),
        attribute.attribute("rx", "1"),
        attribute.attribute("fill", "#111"),
      ]),
      svg.rect([
        attribute.attribute("x", "14"),
        attribute.attribute("y", "3"),
        attribute.attribute("width", "7"),
        attribute.attribute("height", "7"),
        attribute.attribute("rx", "1"),
        attribute.attribute("fill", "#111"),
      ]),
      svg.rect([
        attribute.attribute("x", "3"),
        attribute.attribute("y", "14"),
        attribute.attribute("width", "7"),
        attribute.attribute("height", "7"),
        attribute.attribute("rx", "1"),
        attribute.attribute("fill", "#111"),
      ]),
      svg.rect([
        attribute.attribute("x", "14"),
        attribute.attribute("y", "14"),
        attribute.attribute("width", "7"),
        attribute.attribute("height", "7"),
        attribute.attribute("rx", "1"),
        attribute.attribute("fill", "#111"),
        attribute.attribute("opacity", "0.4"),
      ]),
    ],
  )
}

pub fn icon_blog() -> Element(msg) {
  svg.svg(
    [
      attribute.attribute("viewBox", "0 0 24 24"),
      attribute.attribute("fill", "none"),
      attribute.attribute("xmlns", "http://www.w3.org/2000/svg"),
    ],
    [
      svg.rect([
        attribute.attribute("x", "4"),
        attribute.attribute("y", "3"),
        attribute.attribute("width", "16"),
        attribute.attribute("height", "18"),
        attribute.attribute("rx", "2"),
        attribute.attribute("stroke", "#111"),
        attribute.attribute("stroke-width", "1.8"),
      ]),
      svg.line([
        attribute.attribute("x1", "8"),
        attribute.attribute("y1", "8"),
        attribute.attribute("x2", "16"),
        attribute.attribute("y2", "8"),
        attribute.attribute("stroke", "#111"),
        attribute.attribute("stroke-width", "1.8"),
        attribute.attribute("stroke-linecap", "round"),
      ]),
      svg.line([
        attribute.attribute("x1", "8"),
        attribute.attribute("y1", "12"),
        attribute.attribute("x2", "16"),
        attribute.attribute("y2", "12"),
        attribute.attribute("stroke", "#111"),
        attribute.attribute("stroke-width", "1.8"),
        attribute.attribute("stroke-linecap", "round"),
      ]),
      svg.line([
        attribute.attribute("x1", "8"),
        attribute.attribute("y1", "16"),
        attribute.attribute("x2", "12"),
        attribute.attribute("y2", "16"),
        attribute.attribute("stroke", "#111"),
        attribute.attribute("stroke-width", "1.8"),
        attribute.attribute("stroke-linecap", "round"),
      ]),
    ],
  )
}

pub fn icon_3d_printing() -> Element(msg) {
  svg.svg(
    [
      attribute.attribute("viewBox", "0 0 24 24"),
      attribute.attribute("fill", "none"),
      attribute.attribute("xmlns", "http://www.w3.org/2000/svg"),
    ],
    [
      svg.path([
        attribute.attribute("d", "M12 2L2 7v10l10 5 10-5V7L12 2z"),
        attribute.attribute("stroke", "#111"),
        attribute.attribute("stroke-width", "1.8"),
        attribute.attribute("stroke-linejoin", "round"),
      ]),
      svg.path([
        attribute.attribute("d", "M12 12V22"),
        attribute.attribute("stroke", "#111"),
        attribute.attribute("stroke-width", "1.8"),
        attribute.attribute("stroke-linecap", "round"),
      ]),
      svg.path([
        attribute.attribute("d", "M2 7l10 5 10-5"),
        attribute.attribute("stroke", "#111"),
        attribute.attribute("stroke-width", "1.8"),
        attribute.attribute("stroke-linecap", "round"),
        attribute.attribute("stroke-linejoin", "round"),
      ]),
      svg.path([
        attribute.attribute("d", "M12 7l10-5"),
        attribute.attribute("stroke", "#111"),
        attribute.attribute("stroke-width", "1.8"),
        attribute.attribute("stroke-linecap", "round"),
      ]),
      svg.circle([
        attribute.attribute("cx", "12"),
        attribute.attribute("cy", "12"),
        attribute.attribute("r", "2"),
        attribute.attribute("fill", "#111"),
      ]),
    ],
  )
}

pub fn icon_arrow() -> Element(msg) {
  svg.svg(
    [
      attribute.attribute("viewBox", "0 0 24 24"),
      attribute.attribute("fill", "none"),
      attribute.attribute("xmlns", "http://www.w3.org/2000/svg"),
    ],
    [
      svg.path([
        attribute.attribute("d", "M5 12h14M13 6l6 6-6 6"),
        attribute.attribute("stroke", "currentColor"),
        attribute.attribute("stroke-width", "2"),
        attribute.attribute("stroke-linecap", "round"),
        attribute.attribute("stroke-linejoin", "round"),
      ]),
    ],
  )
}

// ── Link Item ──────────────────────────────────────────────────────────────
// Renders a single link row. Hover effects are handled entirely by CSS.
// `delay` is a CSS time string like "0.5s" for staggered entrance animations.

pub fn link_item(
  label: String,
  sub: String,
  href: String,
  icon: Element(msg),
  loaded: Bool,
  delay: String,
) -> Element(msg) {
  link_item_with_click(label, sub, href, icon, loaded, delay, None)
}

pub fn link_item_with_click(
  label: String,
  sub: String,
  href: String,
  icon: Element(msg),
  loaded: Bool,
  delay: String,
  on_click: Option(fn() -> msg),
) -> Element(msg) {
  link_item_with_click_and_class(label, sub, href, icon, loaded, delay, on_click, None)
}

pub fn link_item_with_click_and_class(
  label: String,
  sub: String,
  href: String,
  icon: Element(msg),
  loaded: Bool,
  delay: String,
  on_click: Option(fn() -> msg),
  extra_class: Option(String),
) -> Element(msg) {
  let base_class = case loaded {
    True -> "link-item visible"
    False -> "link-item"
  }
  
  let item_class = case extra_class {
    Some(extra) -> base_class <> " " <> extra
    None -> base_class
  }
  
  let base_attrs = [
    attribute.class(item_class),
    attribute.style([#("transition-delay", delay)]),
  ]
  
  let attrs = case on_click {
    Some(click_handler) -> {
      let click_attr = 
        attribute.on("click", fn(_event) { Ok(click_handler()) })
      list.append(base_attrs, [click_attr, attribute.style([#("cursor", "none")])])
    }
    None -> {
      list.append(base_attrs, [
        attribute.href(href),
        attribute.target("_blank"),
        attribute.rel("noopener noreferrer"),
      ])
    }
  }
  
  let element = case on_click {
    Some(_) -> html.div
    None -> html.a
  }
  
  element(attrs, [
    html.div([attribute.class("link-icon")], [icon]),
    html.div(
      [attribute.class("link-info")],
      [
        html.span([attribute.class("link-label")], [html.text(label)]),
        html.span([attribute.class("link-sub")], [html.text(sub)]),
      ],
    ),
    html.div([attribute.class("link-arrow")], [icon_arrow()]),
  ])
}
