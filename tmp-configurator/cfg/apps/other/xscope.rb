require "engine/configurator"

class XScopeConfigurator < Configurator
  protected

  def install
    appstore action: :install,
             name:   "xScope"
  end
end
