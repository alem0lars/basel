require "engine/configurator"

class MarkedConfigurator < Configurator
  protected

  def required_data() %i(text_editor image_editor) end

  def install
    appstore action: :install,
             name:   "Marked"
  end

  def configure
    default msg:    "Enable transparency",
            domain: "com.brettterpstra.marked2",
            name:   "transparentInBackground",
            value:  true
    default msg:    "Set background alpha level.",
            domain: "com.brettterpstra.marked2",
            name:   "alphaLevel",
            value:  0.8
    default msg:    "Enable minimap navigation.",
            domain: "com.brettterpstra.marked2",
            name:   "enableMiniMap",
            value:  true
    default msg:    "Headlines collapse sections.",
            domain: "com.brettterpstra.marked2",
            name:   "collapsibleHeadlines",
            value:  true
    default msg:    "Require command-click to collapse sections.",
            domain: "com.brettterpstra.marked2",
            name:   "requireCmdToCollapse",
            value:  true
    default msg:    "Show scroll progress indicator.",
            domain: "com.brettterpstra.marked2",
            name:   "showDocumentProgress",
            value:  true
    default msg:    "Automatically validate URLs on update.",
            domain: "com.brettterpstra.marked2",
            name:   "validateLinksOnLoad",
            value:  true
    default msg:    "Table of contents tracks scroll position.",
            domain: "com.brettterpstra.marked2",
            name:   "TOCTracksPosition",
            value:  true
    default msg:    "Set default syntax style.",
            domain: "com.brettterpstra.marked2",
            name:   "defaultSyntaxStyle",
            value:  "tomorrow-night.css"
    default msg:    "Set processor.",
            domain: "com.brettterpstra.marked2",
            name:   "defaultProcessor",
            value:  "Discount (GFM)"
    default msg:    "Set external text editor.",
            domain: "com.brettterpstra.marked2",
            name:   "externalEditor",
            value:  data[:text_editor]
    default msg:    "Set external image editor.",
            domain: "com.brettterpstra.marked2",
            name:   "externalImageEditor",
            value:  data[:image_editor]
    default msg:    "Include post title as h1 (MarsEdit).",
            domain: "com.brettterpstra.marked2",
            name:   "meNoteTitles",
            value:  true
    default msg:    "Enable leanpub support.",
            domain: "com.brettterpstra.marked2",
            name:   "bookTxtIsLeanpub",
            value:  true
    default msg:    "Make annotations visible (Scrivener).",
            domain: "com.brettterpstra.marked2",
            name:   "showScrivenerAnnotations",
            value:  true
    default msg:    "Include document titles as markdown headers (Scrivener).",
            domain: "com.brettterpstra.marked2",
            name:   "scrivenerHeaders",
            value:  true
    default msg:    "Include current page title as h1 (VoodooPad).",
            domain: "com.brettterpstra.marked2",
            name:   "vpNoteTitles",
            value:  true
    default msg:    "Highlight markdown errors.",
            domain: "com.brettterpstra.marked2",
            name:   "shouldHighlightMarkupErrors",
            value:  true
  end
end
