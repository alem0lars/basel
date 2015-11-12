require "engine/configurator"

class KarabinerConfigurator < Configurator
  protected

  def install
    brew_install pkg:  "karabiner",
                 cask: true
  end
end
