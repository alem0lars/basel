require "engine/configurator"

class BartenderConfigurator < Configurator
  protected

  def install
    brew_install pkg: "bartender", cask: true
  end

  def configure_settings
    custom msg:    "Open bartender, license it, and install the helper tool.",
           manual: true
    custom msg:    "(Completely) Hide the System Item 'Clock' and show the others in the normal menu bar",
           manual: true
    custom msg:    "For the item 'iStat Menus Status', select: " \
                   "'Show in Bartender Bar, not in Menu Bar'. " \
                   "The other (non System Items) should be left untouched",
           manual: true
    custom msg:    "Set the hotkey to Alt+Option+2",
           manual: true
  end

  def configure_startupitem
    startupitem_add name: "/Applications/Bartender 2.app"
  end
end
