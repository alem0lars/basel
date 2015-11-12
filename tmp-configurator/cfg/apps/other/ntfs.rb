require "engine/configurator"

class NTFSConfigurator < Configurator
  protected

  def install
    brew_install pkg:  "osxfuse",
                 cask: true
    brew_install pkg: "homebrew/fuse/ntfs-3g"
  end
end
