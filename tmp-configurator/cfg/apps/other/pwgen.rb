require "engine/configurator"

class PWGenConfigurator < Configurator
  protected

  def install
    brew_install pkg: "pwgen"
  end
end
