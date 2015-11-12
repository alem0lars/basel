require "engine/configurator"

class GraphicConfigurator < Configurator
  protected

  def install
    appstore action: :install, name: "Graphic"
  end
end
