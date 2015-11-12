require "engine/configurator"

class ZSHConfigurator < Configurator
  protected

  def configure
    custom msg: "Change default shell to ZSH.",
           cmd: "chsh -s /bin/zsh"
    fizzy repo: "git@github.com:alem0lars/configs-zsh",
          cfg:  "zsh",
          inst: "zsh",
          meta: "meta",
          vars: "alem0lars-osx"
  end
end
