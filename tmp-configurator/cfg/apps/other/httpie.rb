require "engine/configurator"

class HttpieConfigurator < Configurator
  protected

  def install
    brew_install pkg: "httpie"
  end
end
