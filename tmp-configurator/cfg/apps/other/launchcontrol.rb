require "engine/configurator"

class LaunchControlConfigurator < Configurator
  protected

  def install
    brew_install pkg:  "launchcontrol",
                 cask: true
  end

  def configure
    default msg:    "Disable tips.",
            domain: "com.soma-zone.LaunchControl.plist",
            name:   "dyakAboutTooltips",
            value:  false
    default msg:    "Quick launch.",
            domain: "com.soma-zone.LaunchControl.plist",
            name:   "warnAboutLoad",
            value:  false
    default msg:    "Synchronize file name and label.",
            domain: "com.soma-zone.LaunchControl.plist",
            name:   "changeLabelWhenRename",
            value:  true
    default msg:    "Enable automatic updates.",
            domain: "com.soma-zone.LaunchControl.plist",
            name:   "SUAutomaticallyUpdate",
            value:  true
    default msg:    "Don't send profile informations.",
            domain: "com.soma-zone.LaunchControl.plist",
            name:   "SUSendProfileInfo",
            value:  false
  end
end
