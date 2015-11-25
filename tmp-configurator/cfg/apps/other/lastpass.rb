require "engine/configurator"

class LastpassConfigurator < Configurator
  def priority() 5 end

  protected

  def install
    # Install standalone application.
    appstore action: :install,
             name:   "Lastpass"
    # Install command-line interface.
    brew_install pkg: "lastpass-cli"
    # Install browsers extension.
    brew_install pkg:    "lastpass",
                 cask:   true
    custom msg:    "Install Lastpass browser (binary enabled) extensions",
           cmd:    "open '/opt/homebrew-cask/Caskroom/lastpass/latest/LastPass Installer.app'",
           manual: true
  end

  def configure_settings
    # TODO
  end
end
