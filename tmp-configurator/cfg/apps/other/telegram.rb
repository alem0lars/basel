require "engine/configurator"

class TelegramConfigurator < Configurator
  protected

  def install
    brew_install pkg: "telegram", cask: true
  end
end
