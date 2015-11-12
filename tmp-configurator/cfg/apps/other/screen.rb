require "engine/configurator"

class ScreenConfigurator < Configurator
  protected

  def install
    brew_install pkg:  "disablemonitor",
                 cask: true
  end
end
