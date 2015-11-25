require "engine/configurator"

class ATextConfigurator < Configurator
  protected

  def install
    brew_install pkg: "atext", cask: true
  end

  def configure_settings
    default msg:    "Set snippets editor font",
            domain: "com.trankynam.aText",
            name:   "DefaultSnippetEditorFont",
            value:  {
              NSFontNameAttribute: data[:font_name],
              NSFontSizeAttribute: data[:font_size]
            }
    default msg:    "Automatically check for updates",
            domain: "com.trankynam.aText",
            name:   "SUEnableAutomaticChecks",
            value:  true
    default msg:    "Enable snippets sync",
            domain: "com.trankynam.aText",
            name:   "SyncEnabled",
            value:  true
    default msg:    "Sync snippets using iCloud.",
            domain: "com.trankynam.aText",
            name:   "SyncDirectoryType",
            value:  1
  end

  def configure_startupitem
    startupitem_add name: "/opt/homebrew-cask/Caskroom/atext/latest/aText.app"
  end
end
