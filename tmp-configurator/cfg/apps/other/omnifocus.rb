require "engine/configurator"

class OmniFocusConfigurator < Configurator
  protected

  def install
    appstore action: :install,
             name:   "OmniFocus"
  end
end
