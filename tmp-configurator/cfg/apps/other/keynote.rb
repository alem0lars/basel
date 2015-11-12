require "engine/configurator"

class KeynoteConfigurator < Configurator
  protected

  def install
    appstore action: :install,
             name:   "Keynote"
  end
end
