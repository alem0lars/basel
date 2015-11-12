require "engine/configurator"

class HazelConfigurator < Configurator
  protected

  def install
    brew_install pkg:  "hazel",
                 cask: true
  end
end
