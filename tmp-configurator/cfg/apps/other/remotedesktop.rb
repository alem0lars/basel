require "engine/configurator"

class RemoteDesktopConfigurator < Configurator
  protected

  def install
    appstore action: :install,
             name:   "Apple Remote Desktop"
    appstore action: :install,
             name:   "JUMP Desktop"
  end
end
