require "engine/configurator"

class QuicklookConfigurator < Configurator
  protected

  def install
    brew_install pkg: %w(
      qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch
      quicklook-csv betterzipql webpquicklook suspicious-package provisionql
      cert-quicklook
    ), cask: true
  end
end
