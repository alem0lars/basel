require "engine/configurator"

class NMapConfigurator < Configurator
  protected

  def install
    brew_install pkg: "nmap"
  end
end
