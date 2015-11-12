require "engine/configurator"

class RegexConfigurator < Configurator
  protected

  def install
    appstore action: :install,
             name:   "Oyster"
  end

  def configure
    # TODO
  end
end
