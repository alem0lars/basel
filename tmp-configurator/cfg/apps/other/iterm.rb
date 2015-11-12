require "engine/configurator"

class ITermConfigurator < Configurator
  protected

  def install
    brew_install pkg:  "iterm2",
                 cask: true
  end

  def configure
    download url:    "https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Tomorrow%20Night.itermcolors",
             open:   true,
             manual: true
    # TODO: iTerm configuration.
  end
end
