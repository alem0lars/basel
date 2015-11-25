require "engine/configurator"

class ITunesConfigurator < Configurator
  protected

  def configure_startupitem
    startupitem_add name: "/Applications/iTunes.app/Contents/MacOS/iTunesHelper.app"
  end
end
