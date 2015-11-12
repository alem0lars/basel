require "engine/configurator"
require "uri"
require "net/http"

class CoreAppsConfigurator < Configurator
  def priority() 2 end

  protected

  def configure_accounts
    manual msg: "Go to  ‣ System Preferences ‣ Internet Accounts and add your accounts, like Google, Twitter, Facebook, LinkedIN, Flickr."
  end

  def configure_dock
    default msg:    "Setting the icon size of Dock items to 36 pixels for optimal size/screen-realestate",
            domain: "com.apple.dock",
            name:   "tilesize",
            value:  36
    default msg:    "In Mission Control group windows by application.",
            domain: "com.apple.dock",
            name:   "expose-group-by-app",
            value:  true
    # Set the wallpaper.
    path = if data[:wallpaper]
      File.expand_path(if File.file? data[:wallpaper]
        data[:wallpaper]
      elsif data[:wallpaper] =~ URI::regexp
        path = "~/Pictures/Wallpaper.#{File.extname(data[:wallpaper])}"
        Net::HTTP.start(data[:wallpaper]) do |http|
          resp = http.get(path)
          open(path, "wb") { |file| file.write(resp.body) }
        end
        path
      end)
    end
    if path
      custom msg: "Set wallpaper.",
             cmd: "sqlite3 " +
                  "'~/Library/Application Support/Dock/desktoppicture.db' " +
                  "\"update data set value = '#{path}'\""
    end
  end

  def configure_screensaver
    default msg: "Require password after sleep or screen saver begins.",
            domain: "com.apple.screensaver",
            name: "askForPassword",
            value: 1
    default msg: "Wait no time before asking password after sleep or screen saver.",
            domain: "com.apple.screensaver",
            name: "askForPasswordDelay",
            value: 0
  end

  def configure_screencapture
    default msg: "Set screenshot format to PNG.",
            domain: "com.apple.screencapture",
            name: "type",
            value: "png"
  end

  def configure_crashreporter
    default msg:    "Disable the crash reporter.",
            domain: "com.apple.CrashReporter",
            name:   "DialogType",
            value:  "none"
  end

  def configure_softwareupdate
    default msg:    "Check for software updates daily, not just once per week.",
            domain: "com.apple.SoftwareUpdate",
            name:   "ScheduleFrequency",
            value:  1
  end

  def configure_desktopservices
    default msg:    "Avoid creating '.DS_Store' files on network volumes",
            domain: "com.apple.desktopservices",
            name:   "DSDontWriteNetworkStores",
            value:  true
    default msg:    "Avoid creation of .DS_Store files on network volumes.",
            domain: "com.apple.desktopservices",
            name:   "DSDontWriteNetworkStores",
            value:  true
    default msg:    "Disable Spotlight indexing for any volume that gets mounted and has not yet been indexed before.",
            domain: "/.Spotlight-V100/VolumeConfiguration",
            name:   "Exclusions",
            value:  %w(/Volumes),
            root:   true
  end

  def configure_quicktime
    default msg:    "Auto-play videos when opened with QuickTime Player",
            domain: "com.apple.QuickTimePlayerX",
            name:   "MGPlayMovieOnOpen",
            value:  1
  end

  def configure_networkbrowser
    default msg:    "Enable AirDrop over Ethernet and on unsupported Macs",
            domain: "com.apple.NetworkBrowser",
            name:   "BrowseAllInterfaces",
            value:  true
  end

  def configure_finder
    default msg:    "Show icons for hard drives, servers, and removable media on the desktop.",
            domain: "com.apple.finder",
            name:   %w(
              ShowHardDrivesOnDesktop ShowExternalHardDrivesOnDesktop
              ShowRemovableMediaOnDesktop ShowMountedServersOnDesktop
            ),
            value:  true
    default msg: "Disable the warning when changing a file extension.",
            domain: "com.apple.finder",
            name: "FXEnableExtensionChangeWarning",
            value: false
    default msg:    "Show absolute path in finder's title bar.",
            domain: "com.apple.finder",
            name:   "_FXShowPosixPathInTitle",
            value:  true
    default domain: "com.apple.finder",
            name:   "NewWindowTarget",
            value:  "PfLo"
    default msg:    "Set default Finder location to home folder.",
            domain: "com.apple.finder",
            name:   "NewWindowTargetPath",
            value:  "file://${HOME}"
    default msg:    "Use current directory as default search scope in Finder.",
            domain: "com.apple.finder",
            name:   "FXDefaultSearchScope",
            value:  "SCcf"
    default msg: "Show status bar in Finder by default.",
            domain: "com.apple.finder",
            name: "ShowStatusBar",
            value: true
    default msg: "Show path bar in Finder by default.",
            domain: "com.apple.finder",
            name: "ShowPathbar",
            value: true
    default msg: "Use column view in all Finder windows by default.",
            domain: "com.apple.finder",
            name: "FXPreferredViewStyle",
            value: "Clmv"
    plist msg:  "Show item info near icons in other icon views",
          cmd:  ["Set :DesktopViewSettings:IconViewSettings:showItemInfo true",
                 "Set :StandardViewSettings:IconViewSettings:showItemInfo true",
                 "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true"],
          path: "~/Library/Preferences/com.apple.finder.plist"
    plist msg:  "Show item info to the right of the icons on the desktop.",
          cmd:  "Set DesktopViewSettings:IconViewSettings:labelOnBottom false",
          path: "~/Library/Preferences/com.apple.finder.plist"
    plist msg: "Enable snap-to-grid for icons on the desktop and in other icon views.",
          cmd: ["Set :DesktopViewSettings:IconViewSettings:arrangeBy grid",
                "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid",
                "Set :StandardViewSettings:IconViewSettings:arrangeBy grid"],
          path: "~/Library/Preferences/com.apple.finder.plist"
    plist msg:  "Set grid spacing for icons on the desktop and in other icon views.",
          cmd:  ["Set :DesktopViewSettings:IconViewSettings:gridSpacing 100",
                 "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 100",
                 "Set :StandardViewSettings:IconViewSettings:gridSpacing 100"],
          path: "~/Library/Preferences/com.apple.finder.plist"
    plist msg:  "Set the size of icons on the desktop and in other icon views.",
          cmd:  ["Set :DesktopViewSettings:IconViewSettings:iconSize 80",
                 "Set :FK_StandardViewSettings:IconViewSettings:iconSize 80",
                 "Set :StandardViewSettings:IconViewSettings:iconSize 80"],
          path: "~/Library/Preferences/com.apple.finder.plist"
  end

  def configure_diskutility
    default msg:    "Unlock debug menu in Disk Utility.",
            domain: "com.apple.DiskUtility",
            name:   "DUDebugMenuEnabled",
            value:  1
  end

  def configure_safari
    default msg:    "Disable universal search (don’t send search queries to Apple).",
            domain: "com.apple.Safari",
            name:   "UniversalSearchEnabled",
            value:  false
    default msg:    "Disable search suggestions (don’t send search queries to Apple).",
            domain: "com.apple.Safari",
            name:   "SuppressSearchSuggestions",
            value:  true
    default msg:    "Hide Safari's bookmarks bar by default.",
            domain: "com.apple.Safari",
            name:   "ShowFavoritesBar",
            value:  false
    default msg:    "Hide Safari's sidebar in Top Sites.",
            domain: "com.apple.Safari",
            name:   "ShowSidebarInTopSites",
            value:  false
    default msg:    "Disable Safari's thumbnail cache for History and Top Sites.",
            domain: "com.apple.Safari",
            name:   "DebugSnapshotsUpdatePolicy",
            value:  2
    default msg:    "Enable Safari's debug menu.",
            domain: "com.apple.Safari",
            name:   "IncludeInternalDebugMenu",
            value:  true
    default msg:    "Make Safari's search banners default to Contains instead of Starts With.",
            domain: "com.apple.Safari",
            name:    "FindOnPageMatchesWordStartsOnly",
            value:   false
    default msg:    "Remove useless icons from Safari's bookmarks bar.",
            domain: "com.apple.Safari",
            name:   "ProxiesInBookmarksBar",
            value:  "()"
    default msg:    "Enable the Develop menu and the Web Inspector in Safari.",
            domain: "com.apple.Safari",
            name:   ["IncludeDevelopMenu",
                     "WebKitDeveloperExtrasEnabledPreferenceKey",
                     "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled"],
            value:  true
    default msg:   "Adding a context menu item for showing the Web Inspector in web views.",
            name:  "WebKitDeveloperExtras",
            value: true
  end
end
