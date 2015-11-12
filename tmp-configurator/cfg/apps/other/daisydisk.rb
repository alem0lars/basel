require "engine/configurator"

class DaisyDiskConfigurator < Configurator
  protected

  def install
    appstore action: :install,
             name:   "DaisyDisk"
  end
end
