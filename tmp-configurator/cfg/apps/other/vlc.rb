require "engine/configurator"

class VLCConfigurator < Configurator
  protected

  def install
    brew_install pkg:    "paragon-ntfs",
                 cask:   true
  end
end
