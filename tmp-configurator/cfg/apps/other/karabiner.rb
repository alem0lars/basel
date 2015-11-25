require "engine/configurator"

class KarabinerConfigurator < Configurator
  protected

  def install
    brew_install pkg:  "karabiner",
                 cask: true
  end

  def configure_startupitem
    startupitem_add name: "/Applications/Karabiner.app"
  end
end
