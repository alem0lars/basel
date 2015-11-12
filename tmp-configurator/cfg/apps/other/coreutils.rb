require "engine/configurator"

class CoreUtilsConfigurator < Configurator
  def priority() 5 end

  def install
    brew_install pkg: "coreutils"
  end
end
