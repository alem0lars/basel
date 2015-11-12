require "engine/configurator"

class MathematicaConfigurator < Configurator
  protected

  def install
    custom msg: "Download and install mathematica"
           manual: true
    custom msg: "Install mathematica extras"
           manual: true
  end
end
