require "engine/configurator"

class CheatsheetConfigurator < Configurator
  protected

  def install
    brew_install pkg:  "cheatsheet",
                 cask: true
  end
end
