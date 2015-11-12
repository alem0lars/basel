require "engine/configurator"

class GitConfigurator < Configurator
  protected

  def configure
    fizzy repo: "git@github.com:alem0lars/configs-git",
          cfg:  "git",
          inst: "git",
          meta: "meta",
          vars: "alem0lars-osx"
  end
end
