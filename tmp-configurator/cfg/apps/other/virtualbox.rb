require "engine/configurator"

class VirtualboxConfigurator < Configurator
  protected

  def install
    brew_install pkg:  "virtualbox",
                 cask: true
    brew_install pkg:  "virtualbox-extension-pack",
                 cask: true
  end
end
