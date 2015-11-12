require "engine/configurator"

class TorrentConfigurator < Configurator
  protected

  def install
    brew_install pkg: "utorrent", cask: true
    custom msg: "Install uTorrent",
           cmd: "open '/opt/homebrew-cask/Caskroom/utorrent/latest/uTorrent.app'",
           manual: true
  end
end
