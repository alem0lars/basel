require "engine/configurator"

class StatsConfigurator < Configurator
  protected

  def install
    brew_install pkg:  "istat-menus",
                 cask: true
  end

  def configure
    # TODO: configure istats (already configured but i need to add commands here, based on exported preferences).
  end
end
