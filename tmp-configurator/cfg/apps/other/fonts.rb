require "engine/configurator"

class FontsConfigurator < Configurator
  protected

  def install
    brew_install pkg: "font-lato",
                 cask: true
  end
end
