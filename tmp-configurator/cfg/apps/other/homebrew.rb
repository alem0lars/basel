require "engine/configurator"

class HomebrewConfigurator < Configurator
  def priority() 3 end

  def install
    unless program_available? "brew"
      custom msg: "Install Homebrew.",
             cmd: "ruby -e \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\""
    end
    brew_doctor
    brew_install pkg: "caskroom/cask/brew-cask"
  end

  def configure
    brew_tap repo: "alem0lars/homebrew-repo"
    brew_tap repo: "homebrew/homebrew-science"
    brew_tap repo: "homebrew/binary"
    brew_tap repo: "caskroom/fuse"
    brew_tap repo: "caskroom/fonts"
    brew_upgrade
  end
end
