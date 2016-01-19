require "engine/configurator"

class DuetConfigurator < Configurator
  protected

  def install
    brew_install pkg: "duet", cask: true
  end
end
