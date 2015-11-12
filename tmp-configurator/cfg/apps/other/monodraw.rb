require "engine/configurator"

class MonodrawConfigurator < Configurator
  protected

  def install
    brew_install pkg:  "monodraw",
                 cask: true
  end
end
