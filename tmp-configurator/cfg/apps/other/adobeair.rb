require "engine/configurator"

class AdobeAirConfigurator < Configurator
  protected

  def install
    brew_install pkg:  "adobe-air",
                 cask: true
  end
end
