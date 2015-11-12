require "engine/configurator"

class SlackConfigurator < Configurator
  protected

  def install
    brew_install pkg: "slack", cask: true
  end
end
