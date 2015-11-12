require "engine/configurator"

class SnitchConfigurator < Configurator
  protected

  def install
    brew_install pkg:  "micro-snitch",
                 cask: true
    # Install little-snitch.
    brew_install pkg:  "little-snitch",
                 cask: true
    manual cmd: "open '/opt/homebrew-cask/Caskroom/little-snitch/3.6/Little Snitch Installer.app'"
  end
end
