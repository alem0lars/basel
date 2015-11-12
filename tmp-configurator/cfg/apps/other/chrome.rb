require "engine/configurator"

class ChromeConfigurator < Configurator
  protected

  def install
    brew_install pkg:  "google-chrome",
                 cask: true
  end

  def configure
    default msg:    "Disable the annoying backswipe in Chrome.",
            domain: "com.google.Chrome",
            name:   "AppleEnableSwipeNavigateWithScrolls",
            value:  false

    default msg:    "Use the system-native print preview dialog in Chrome.",
            domain: "com.google.Chrome",
            name:   "DisablePrintPreview",
            value:  true

    default msg:    "Disable the annoying backswipe in Chrome Canary.",
            domain: "com.google.Chrome.canary",
            name:   "AppleEnableSwipeNavigateWithScrolls",
            value:  false

    default msg:    "Use the system-native print preview dialog in Chrome Canary.",
            domain: "com.google.Chrome.canary",
            name:   "DisablePrintPreview",
            value:  true
  end
end
