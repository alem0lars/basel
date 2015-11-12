require "engine/configurator"

class KaleidoscopeConfigurator < Configurator
  protected

  def install
    appstore action: :install,
             name:   "Kaleidoscope"
    brew_install pkg: "ksdiff", cask: true
  end

  def configure
    default msg:    "Dark mode",
            domain: "com.blackpixel.kaleidoscope",
            name:   "KSPreferencesWindowControllerPreviousPaneIdentifier",
            value:  "com.blackpixel.preferences.usage"
    default msg:    "Don't send anonymous system profile",
            domain: "com.blackpixel.kaleidoscope",
            name:   "KSSendsSystemProfile",
            value:  false
  end
end
