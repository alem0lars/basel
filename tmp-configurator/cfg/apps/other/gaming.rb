require "engine/configurator"

class GamingConfigurator < Configurator
  protected

  def install
    brew_install pkg: "heroes-of-newerth",
                 cask: true
  end
end
