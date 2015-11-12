require "engine/configurator"

class JDownloaderConfigurator < Configurator
  protected

  def install
    brew_install pkg:  "jdownloader",
                 cask: true
  end
end
