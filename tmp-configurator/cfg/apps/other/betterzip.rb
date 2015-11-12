require "engine/configurator"

class BetterZipConfigurator < Configurator
  protected

  def install
    brew_install pkg:  "betterzip",
                 cask: true
    brew_install pkg: "rar"
  end

  def configure
    default msg:    "Set path to rar program.",
            domain: "com.macitbetter.betterzip",
            name:   "rar",
            value:  "/usr/local/bin/rar"
end
