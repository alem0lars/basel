require "engine/configurator"

class MumbleConfigurator < Configurator
  protected

  def install
    brew_install pkg:  "mumble",
                 cask: true
  end
end
