require "engine/configurator"

class CheatsheetConfigurator < Configurator
  protected

  def install
    brew_install pkg:  "cheatsheet",
                 cask: true
  end

  def configure_startupitem
    startupitem_add name: "/Applications/CheatSheet.app"
  end
end
