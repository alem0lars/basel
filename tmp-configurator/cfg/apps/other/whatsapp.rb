require "engine/configurator"

class WhatsAppConfigurator < Configurator
  protected

  def install
    brew_install pkg: "chitchat", cask: true
  end
end
