require "engine/configurator"

class OmniGraffleConfigurator < Configurator
  protected

  def install
    appstore action: :install,
             name:   "OmniGraffle"
  end
end
