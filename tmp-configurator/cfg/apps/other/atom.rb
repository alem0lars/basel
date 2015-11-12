require "engine/configurator"

class AtomConfigurator < Configurator
  protected

  def install
    brew_install pkg: "nmap", cask: true
    # TODO: install plugins
  end

  def configure
    # TODO
  end
end
