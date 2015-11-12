require "engine/configurator"

class IntelliJIDEAConfigurator < Configurator
  protected

  def install
    brew_install pkg:  "intellij-idea",
                 cask: true
  end
end
