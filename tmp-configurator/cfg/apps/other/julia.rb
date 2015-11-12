require "engine/configurator"

class JuliaConfigurator < Configurator
  protected

  def install
    brew_install pkg:  "julia",
                 cask: true
  end
end
