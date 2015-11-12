require "engine/configurator"

class ColorPickerConfigurator < Configurator
  protected

  def install
    appstore action: :install,
             name:   "Sip"
  end

  def configure
    default msg:    "Enable color history",
            domain: "com.ruiaureliano.Sip",
            name:   "SIP_PREFS_PREFFIX_3.2_SHOW_COLOR_HISTORY",
            value:  true
    default msg:    "Set color history size",
            domain: "com.ruiaureliano.Sip",
            name:   "SIP_PREFS_PREFFIX_3.2_COLOR_HISTORY",
            value:  8
    default msg:    "Auto import colors when available",
            domain: "com.ruiaureliano.Sip",
            name:   "SIP_PREFS_PREFFIX_3.2_COPY_COLOR",
            value:  true
    default msg:    "Show color name in Magnifier",
            domain: "com.ruiaureliano.Sip",
            name:   "SIP_PREFS_PREFFIX_3.2_SHOW_NAME_OVERLAY",
            value:  true
    default msg:    "Show color code in Magnifier",
            domain: "com.ruiaureliano.Sip",
            name:   "SIP_PREFS_PREFFIX_3.2_SHOW_COLOR_OVERLAY",
            value:  true
    default msg:    "Remove white space",
            domain: "com.ruiaureliano.Sip",
            name:   "SIP_PREFS_PREFFIX_3.2_REMOVE_SPACES",
            value:  true
    default msg:    "Include color name",
            domain: "com.ruiaureliano.Sip",
            name:   "SIP_PREFS_PREFFIX_3.2_SHOW_COLOR_NAME",
            value:  true
    default msg:    "Include alpha value",
            domain: "com.ruiaureliano.Sip",
            name:   "SIP_PREFS_PREFFIX_3.2_INCLUDE_ALPHA",
            value:  true
    default msg:    "CSS format all caps",
            domain: "com.ruiaureliano.Sip",
            name:   "SIP_PREFS_PREFFIX_3.2_UPPERCASE",
            value:  true
    default msg:    "Show prefix '#'",
            domain: "com.ruiaureliano.Sip",
            name:   "SIP_PREFS_PREFFIX_3.2_SHOW_HASH",
            value:  true
    default msg:    "Show fraction number",
            domain: "com.ruiaureliano.Sip",
            name:   "SIP_PREFS_PREFFIX_3.2_FRACTION_NUMBERS",
            value:  true
    default msg:    "Remove unnecessary '0s'",
            domain: "com.ruiaureliano.Sip",
            name:   "SIP_PREFS_PREFFIX_3.2_REMOVE_ZEROS",
            value:  true
    default msg:    "Decimal value spaces",
            domain: "com.ruiaureliano.Sip",
            name:   "SIP_PREFS_PREFFIX_3.2_FLOAT_DECIMAL",
            value:  2
  end
end
