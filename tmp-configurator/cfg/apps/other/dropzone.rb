require "engine/configurator"

class DropzoneConfigurator < Configurator
  protected

  def install
    brew_install pkg: "dropzone",
                 cask: true
  end

  def configure
    default msg:    "Launch at login.",
            domain: "com.aptonic.Dropzone3",
            name:   "LaunchAtLogin",
            value:  true
    default msg:    "Grid icon size.",
            domain: "com.aptonic.Dropzone3",
            name:   "GridIconSize",
            value:  70
    default msg:    "Animate grid opening and closing.",
            domain: "com.aptonic.Dropzone3",
            name:   "AnimateGrid",
            value:  true
    default msg:    "Show service key overlays.",
            domain: "com.aptonic.Dropzone3",
            name:   "ServiceKeyOverlays",
            value:  true
    default msg:    "Notifications.",
            domain: "com.aptonic.Dropzone3",
            name:   "GrowlNotifications",
            value:  true
    default msg:    "Play sounds.",
            domain: "com.aptonic.Dropzone3",
            name:   "PlaySounds",
            value:  false
  end
end
