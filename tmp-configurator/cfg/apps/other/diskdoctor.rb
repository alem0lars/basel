require "engine/configurator"

class DiskDoctorConfigurator < Configurator
  protected

  def install
    appstore action: :install,
             name:   "Disk Doctor"
  end
end
