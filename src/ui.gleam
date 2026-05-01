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

pub fn icon_github() -> Element(msg) {
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
          "M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0 1 12 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0 0 22 12.017C22 6.484 17.522 2 12 2z",
        ),
        attribute.attribute("fill", "#111"),
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
  let item_class = case loaded {
    True -> "link-item visible"
    False -> "link-item"
  }
  html.a(
    [
      attribute.href(href),
      attribute.target("_blank"),
      attribute.rel("noopener noreferrer"),
      attribute.class(item_class),
      attribute.style([#("transition-delay", delay)]),
    ],
    [
      html.div([attribute.class("link-icon")], [icon]),
      html.div(
        [attribute.class("link-info")],
        [
          html.span([attribute.class("link-label")], [html.text(label)]),
          html.span([attribute.class("link-sub")], [html.text(sub)]),
        ],
      ),
      html.div([attribute.class("link-arrow")], [icon_arrow()]),
    ],
  )
}
