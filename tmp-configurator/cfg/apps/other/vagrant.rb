require "engine/configurator"

class VagrantConfigurator < Configurator
  protected

  def install
    brew_install pkg: "vagrant", cask: true
    brew_install pkg: "vagrant-manager", cask: true
  end
end
