require "engine/configurator"

class MercurialConfigurator < Configurator
  protected

  def install
    brew_install pkg: "mercurial"
  end

  def configure
    custom msg: "Python integration"
           cmd: "mkdir -p ~/Library/Python/2.7/lib/python/site-packages && echo '/usr/local/lib/python2.7/site-packages' > ~/Library/Python/2.7/lib/python/site-packages/homebrew.pth"
    fizzy repo: "git@github.com:alem0lars/configs-mercurial",
          cfg:  "mercurial",
          inst: "mercurial",
          meta: "meta",
          vars: "alem0lars-osx"
  end
end
