require "engine/configurator"

class SystemConfigurator < Configurator
  def priority() 1 end

  protected

  def required_data() %i(hostname) end

  def configure_dirs
    mkdir msg:  "Creating the user's temporary directory.",
          path: "~/Tmp"
    mkdir msg:  "Creating the user's development directory.",
          path: "~/Development"
    custom msg: "Unhide user library folder.",
           cmd: "chflags nohidden #{File.expand_path("~/Library")}"
    default msg:    "Set number of recent places.",
            domain: ".GlobalPreferences",
            name:   "NSNavRecentPlacesLimit",
            value:  16
  end

  def configure_etc
    replace_content msg:  "Remove invocation of path_helper (environment variables are already handled by 'environment.plist')",
                    path:  %w(/etc/profile /etc/zprofile /etc/csh.login),
                    match: Regexp.new("if.+/usr/libexec/path_helper(.+\\n)*(endif|fi)"),
                    with:  nil
  end

  def configure_hostname
    sysconfig msg:   "Set hostname to `#{data[:hostname]}`.",
              name:  %w(ComputerName HostName LocalHostName),
              value: data[:hostname]

    default msg:     "Set Samba server name to `#{data[:hostname]}`.",
            domain:  "/Library/Preferences/SystemConfiguration/com.apple.smb.server",
            name:    "NetBIOSName",
            value:   data[:hostname],
            root: true
  end

  def configure_shutdown
    default msg:    "Disable system-wide resume.",
            domain: "com.apple.systempreferences",
            name:   "NSQuitAlwaysKeepsWindows",
            value:  false

    syssetup msg:   "Automatically restart if the computer freezes.",
             name:  "setrestartfreeze",
             value: "on"
  end

  def configure_save
    default msg:  "Expand save panel by default.",
            name:  NSNavPanelExpandedStateForSaveMode,
            value: true
  end

  def configure_print
    default msg:   "Expand print panel by default.",
            name:  PMPrintingExpandedStateForPrint,
            value: true

    default msg:    "Automatically quit printer app once the print jobs complete.",
            domain: "com.apple.print.PrintingPrefs",
            name:   "Quit When Finished",
            value:  true
  end

  def configure_icloud
    default msg:   "Save to disk, rather than iCloud, by default.",
            name:  "NSDocumentSaveNewDocumentsToCloud",
            value: false
  end

  def configure_spellcheck
    default msg:   "Disable smart quotes.",
            name:  "NSAutomaticQuoteSubstitutionEnabled",
            value: false

    default msg:   "Disable smart dashes.",
            name:  "NSAutomaticDashSubstitutionEnabled",
            value: false

    default msg:   "Disable auto-correct.",
            name:  "NSAutomaticSpellingCorrectionEnabled",
            value: false
  end

  def configure_interface
    default msg:     "Enable dark mode.",
            name:    "AppleInterfaceTheme",
            value:   "Dark"

    default msg:   "Enable subpixel font rendering on non-Apple LCDs",
            name:  "AppleFontSmoothing",
            value: 2

    default msg:   "Set sidebar icon size to medium.",
            name:  "NSTableViewDefaultSizeMode",
            value: 1

    default msg:   "Always show scrollbars.",
            name:  "AppleShowScrollBars",
            value: "Always"

    default msg:   "Increase window resize speed.",
            name:  "NSWindowResizeTime",
            value: 0.001

    default msg:     "Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window.",
            domain:  "/Library/Preferences/com.apple.loginwindow",
            name:    "AdminHostInfo",
            value:   "HostName",
            root: true

    default msg:    "Set Help Viewer windows to non-floating mode.",
            domain: "com.apple.helpviewer",
            name:   "DevMode",
            value:  true
  end
end

NSNavPanelExpandedStateForSaveMode = %w(
  NSNavPanelExpandedStateForSaveMode
  NSNavPanelExpandedStateForSaveMode2
)

PMPrintingExpandedStateForPrint = %w(
  PMPrintingExpandedStateForPrint
  PMPrintingExpandedStateForPrint2
)
