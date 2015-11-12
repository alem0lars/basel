require "engine/configurator"

class TrelloConfigurator < Configurator
  protected

  def install
    appstore action: :install,
             name:   "Lists for Trello"
  end
end
