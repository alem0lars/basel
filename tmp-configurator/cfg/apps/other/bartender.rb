require "engine/configurator"

class BartenderConfigurator < Configurator
  protected

  def install
    brew_install pkg: "bartender", cask: true
  end

  def configure_settings
    custom msg:    "Open bartender, license it, and install the helper tool."
           manual: true
    custom msg:    "For the System Item 'Clock', select: " \
                   "'Completely Hide Menu Bar Item'."
           manual: true
    custom msg:    "For the item 'iStat Menus Status', select: " \
                   "'Show in Bartender Bar, not in Menu Bar'. " \
                   "The other (non System Items) should be left untouched",
           manual: true
    custom msg:    "Set the hotkey to Alt+Option+1",
           manual: true
  end

  def configure_startupitem
    startupitem_add name: "/opt/homebrew-cask/Caskroom/atext/latest/aText.app"
  end
end
