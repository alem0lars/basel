require "engine/configurator"

class AtomConfigurator < Configurator
  protected

  def install
    brew_install pkg: "atom", cask: true
    apm_install pkg: [
      # languages
      "language-restructuredtext",
      "language-lua",
      "language-docker",
      # autocomplete
      "autocomplete-plus",
      "autocomplete-python",
      # linter
      "linter",
      "linter-pylama",
      "linter-luacheck",
      "linter-docker",
      # aligner
      "aligner",
      "aligner-python",
      # python misc
      "python-tools",
      "MagicPython",
      # minimap
      "minimap",
      "minimap-highlight-selected",
      "minimap-pigments",
      "minimap-find-and-replace",
      "minimap-git-diff",
      "minimap-bookmarks",
      "minimap-selection",
      "minimap-codeglance",
      "minimap-linter",
      "minimap-split-diff",
      # VCS, diff
      "merge-conflicts",
      "split-diff",
      # collaborative
      "firepad",
      # colors
      "color-picker",
      "pigments",
      # misc
      "highlight-selected",
      "editorconfig",
      # sidebar
      "file-icons"
    ]
  end
end
