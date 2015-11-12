require "engine/configurator"

class HerokuConfigurator < Configurator
  protected

  def install
    brew_install pkg: "heroku-toolbelt"
  end
end
