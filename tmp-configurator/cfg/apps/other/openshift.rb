require "engine/configurator"

class OpenShiftConfigurator < Configurator
  protected

  def install
    gem_install pkg: 'rhc', user: true
  end
end
