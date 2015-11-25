require "engine/configurator"

class ShortcatConfigurator < Configurator
  protected

  def install
    brew_install pkg:  "shortcat",
                 cask: true
  end

  def configure_settings
    default msg:    "Don't stay activated after action.",
            domain: "com.sproutcube.Shortcat.plist",
            name:   "ModalModeEnabled",
            value:  false
    default msg:    "Show menu bar icon.",
            domain: "com.sproutcube.Shortcat.plist",
            name:   "ShowMenuBarIcon",
            value:  true
    default msg:    "Don't send profile informations and usage data.",
            domain: "com.sproutcube.Shortcat.plist",
            name:   "SUSendProfileInfo",
            value:  false
    default msg:    "Automatically check for updates",
            domain: "com.sproutcube.Shortcat.plist",
            name:   "SUEnableAutomaticChecks",
            value:  false
    default msg:    "Automatically download updates",
            domain: "com.sproutcube.Shortcat.plist",
            name:   "SUAutomaticallyUpdate",
            value:  false
  end

  def configure_startupitem
    startupitem_add name: "/Applications/Shortcat.rb"
  end
end
