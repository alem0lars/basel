require "engine/configurator"

class XcodeConfigurator < Configurator
  protected

  def install
    appstore action: :install,
             name:   "Xcode"
    custom msg: "Agree XCode license",
           cmd: "xcrun cc",
           root: true
    custom msg: "Install XCode tools",
           cmd: "xcode-select --install",
           root: true,
           manual: true
    # Install plugin manager.
    custom msg: "Install Alcatraz.",
           cmd: "curl -fsSL 'https://raw.githubusercontent.com/supermarin/Alcatraz/deploy/Scripts/install.sh' | sh"
    # Install plugins.
    custom msg:    "Open Xcode and install the following plugins: `" + %w(
                      AdjustFontSize
                      Auto-Importer
                      AutoHighlightSymbol
                      CleanHeaders
                      ColorSenseRainbow
                      DBSmartPanels
                      HTYCopyIssue
                      VVDocumenter-Xcode
                      RTImageAssets
                      FuzzyAutocomplete
                      GitDiff
                      JumpMarks
                      LigatureXcodePlugin
                      XcodeColors
                      CoPilot
                      DerivedDataExterminator
                    ).join(", ") + "`.",
           manual: true
    custom msg: "Install CoPilot plugin.",
           cmd: "curl -fsSL 'https://raw.githubusercontent.com/feinstruktur/CoPilot/master/Misc/install.sh' | sh"

    gem_install pkg: "synx"

    ["Graphics Tools", "Audio Tools", "Hardware IO Tools"].each do |name|
      custom msg: "Download and mount '#{name}' from Apple Developer Center",
             manual: true
      copy_app dir: "/Volumes/#{name}" # TODO: remove it before if existing
      open_prefs dir: "/Volumes/#{name}" # TODO: remove it before if existing
    end
  end

  def configure
    # TODO: Xcode (and plugins) configuration.
  end
end
