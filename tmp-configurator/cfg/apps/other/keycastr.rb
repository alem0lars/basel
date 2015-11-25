require "engine/configurator"

class DropzoneConfigurator < Configurator
  protected

  def install
    brew_install pkg:  "keycastr",
                 cask: true
  end

  def configure
    default msg:    "Don't show preferences at launch.",
            domain: "net.stephendeken.KeyCastr",
            name:   "alwaysShowPrefs",
            value:  false
    default msg:    "Display KeyCastr icon in the menu bar.",
            domain: "net.stephendeken.KeyCastr",
            name:   "displayIcon",
            value:  1
    default msg:    "Select the 'default' visualizer.",
            domain: "net.stephendeken.KeyCastr",
            name:   "selectedVisualizer",
            value:  "Default"
    default msg:    "Font size (size of the keystrokes on the bezel).",
            domain: "net.stephendeken.KeyCastr",
            name:   "default.fontSize",
            value:  34
    default msg:    "Keystroke delay (length of time before the line breaks).",
            domain: "net.stephendeken.KeyCastr",s
            name:   "default.keystrokeDelay",
            value:  0.851
    default msg:    "Fade duration (duration of the fade effect).",
            domain: "net.stephendeken.KeyCastr",
            name:   "default.fadeDuration",
            value:  0.297
    default msg:    "Linger time (length of time before the text fades away).",
            domain: "net.stephendeken.KeyCastr",
            name:   "default.fadeDelay",
            value:  2.817
    default msg:    "Enable automatic updates.",
            domain: "net.stephendeken.KeyCastr",
            name:   "SUEnableAutomaticChecks",
            value:  false
    default msg:    "Don't send anonymous system profile.",
            domain: "net.stephendeken.KeyCastr",
            name:   "SUSendProfileInfo",
            value:  false
  end
end
