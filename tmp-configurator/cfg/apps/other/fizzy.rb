require "engine/configurator"

class FizzyConfigurator < Configurator
  def priority() 4 end

  protected

  def install
    gem_install pkg: "thor"
    brew_install pkg: "fizzy"
    # Configure OSX system-wide (TODO: it should be moved in core ?)
    fizzy repo: "git@github.com:alem0lars/configs-osx",
       cfg:  "osx",
       inst: "osx",
       meta: "meta",
       vars: "alem0lars-osx"
  end
end
