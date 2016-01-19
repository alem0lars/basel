require "engine/configurator"

class SkypeConfigurator < Configurator
  protected

  def install
    brew_install pkg: "skype", cask: true
  end
end
