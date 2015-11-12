require "engine/configurator"

class VideoPlayerConfigurator < Configurator
  protected

  def install
    brew_install pkg: "vlc",
                 cask: true
    pip_install pkg: "livestreamer", root: true
  end
end
