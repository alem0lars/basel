require "engine/configurator"

class UninstallerConfigurator < Configurator
  protected

  def install
    brew_install pkg:  "appcleaner",
                 cask: true
  end

  def configure
    default msg: "Enable automatic updates.",
            domain: "net.freemacsoft.AppCleaner",
            name:   "SUEnableAutomaticChecks",
            value:  true
    custom msg: "Enable smart delete (from preferences)."
           manual: true
end
