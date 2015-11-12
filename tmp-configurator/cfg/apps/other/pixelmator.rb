require "engine/configurator"

class MarkedConfigurator < Configurator
  protected

  def install
    appstore action: :install,
             name:   "Pixelmator"
  end
end
