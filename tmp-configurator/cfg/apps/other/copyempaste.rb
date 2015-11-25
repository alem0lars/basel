require "engine/configurator"

class XcodeConfigurator < Configurator
  protected

  def install
    appstore action: :install,
             name:   "Copy'em Paste"
    custom msg:    "Manually install the Copy'em Paste helper from 'http://www.apprywhere.com/copyem-paste-helper.html'",
           manual: true
  end

  def configure
    default msg:    "Dark theme.",
            domain: "Copy-em-Paste",
            name:   "themeTag",
            value:  1
    default msg:    "Open window near mouse pointer.",
            domain: "Copy-em-Paste",
            name:   "PanelLocationTag",
            value:  1
    default msg:    "Reject duplicates.",
            domain: "Copy-em-Paste",
            name:   "RejectDuplicates",
            value:  1
  end

  def configure_startupitem
    startupitem_add name: "/Applications/Copy'em Paste.app"
  end
end
