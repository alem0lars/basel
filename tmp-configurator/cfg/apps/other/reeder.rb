require "engine/configurator"

class ReederConfigurator < Configurator
  protected

  def install
    appstore action: :install,
             name:   "Reeder"
  end
end
