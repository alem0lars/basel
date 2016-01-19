require "engine/configurator"

class OpenShiftConfigurator < Configurator
  protected

  def install
    gem_install pkg: "rhc"
    custom msg: "Setup rhc", cmd: "rhc setup"
  end
end
