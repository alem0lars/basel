require "engine/configurator"

class NetToolsConfigurator < Configurator
  protected

  def install
    brew_install pkg: "nmap"
  end
end
