require "engine/configurator"

class SafariConfigurator < Configurator
  protected

  def Install
    download url: %w(
               https://update.adblockplus.org/latest/adblockplussafari.safariextz
               https://www.mywot.com/files/downloads/wot-latest.safariextz
               http://nightdev.com/betterttv/safari/betterttv.safariextz
             ),
             open:   true,
             manual: true
  end

  def configure
    default msg:    "Open homepage for new tabs.",
            domain: "com.apple.Safari",
            name:   "NewTabBehavior",
            value:  0
    default msg:    "Show `debug` menu.",
            domain: "com.apple.Safari",
            name:   "IncludeInternalDebugMenu",
            value:  true
    default msg:    "Show `develop` menu.",
            domain: "com.apple.Safari",
            name:   "IncludeDevelopMenu",
            value:  true
    default msg:    "Change homepage.",
            domain: "com.apple.Safari",
            name:   "HomePage",
            value:  data[:homepage]
    default msg:    "Include search engine suggestions.",
            domain: "com.apple.Safari",
            name:   "SuppressSearchSuggestions",
            value:  false
    default msg:    "Include safari suggestions.",
            domain: "com.apple.Safari",
            name:   "UniversalSearchEnabled",
            value:  true
    default msg:    "Set minimum allowed font size.",
            domain: "com.apple.Safari",
            name:   "WebKitMinimumFontSize",
            value:  10
    default msg:    "Don't show favorites bar.",
            domain: "com.apple.Safari",
            name:   "ShowFavoritesBar",
            value:  false
    default msg:    "Show tabs bar.",
            domain: "com.apple.Safari",
            name:   "AlwaysShowTabBar",
            value:  true
    default msg:    "Show status bar.",
            domain: "com.apple.Safari",
            name:   "ShowOverlayStatusBar",
            value:  true
    default msg:    "Allow JavaScript from Smart Search Field.",
            domain: "com.apple.Safari",
            name:   "UnifiedFieldSupportsJavascriptURLs",
            value:  true
  end
end
