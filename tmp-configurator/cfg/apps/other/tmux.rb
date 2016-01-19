require "engine/configurator"

class TmuxConfigurator < Configurator
  protected

  def install
    brew_install pkg: "tmux"
    brew_install pkg: "wemux"
    pip_install pkg: "tmuxp"
  end

  def configure
    fizzy repo: "git@github.com:alem0lars/configs-tmux",
          cfg:  "tmux",
          inst: "tmux",
          meta: "meta",
          vars: "alem0lars-osx"
  end
end
