require "engine/configurator"

class SVNConfigurator < Configurator
  protected

  def configure
    fizzy repo: "git@github.com:alem0lars/configs-svn",
          cfg:  "svn",
          inst: "svn",
          meta: "meta",
          vars: "alem0lars-osx"
  end
end
