require "engine/configurator"

class TransmitConfigurator < Configurator
  protected

  def install
    appstore action: :install,
             name:   "Transmit"
  end

  def configure_settings
    default msg:    "Show Transmit icon in menu bar.",
            domain: "com.panic.Transmit",
            name:   "ShowTransmitMenu",
            value:  true
    default msg:    "Show tab bar.",
            domain: "com.panic.Transmit",
            name:   "TabBarHidden",
            value:  false
    default msg:    "Show item count.",
            domain: "com.panic.Transmit",
            name:   "ShowFileCount",
            value:  true
  end

  def configure_startupitem
    startupitem_add name: "/Applications/Transmit.app/Contents/MacOS/TransmitMenu.app"
  end
end
