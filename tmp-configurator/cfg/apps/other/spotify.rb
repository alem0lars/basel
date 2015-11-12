require "engine/configurator"

class SpotifyConfigurator < Configurator
  protected

  def install
    brew_install pkg:  "spotify",
                 cask: true
  end
end
