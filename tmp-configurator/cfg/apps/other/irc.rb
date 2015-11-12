require "engine/configurator"

class IrcConfigurator < Configurator
  def required_data() %i(irc_username fullname) end

  protected

  def install
    brew_install pkg: "textual", cask: true
  end

  def configure_servers
    # TODO: find a decent way!
    puts "Add the following servers:" + <<-EOS
    - name:     'freenode'
      address:  'Gemini.panicbnc.net/1338'
      password: 'echo alem0lars/freenode:$(lpass show --password "alem0lars @ gemini.panicbnc.net")'
      ssl: true
    - name:     'ircnet'
      address:  'Gemini.panicbnc.net/1338'
      password: 'echo alem0lars/ircnet:$(lpass show --password "alem0lars @ gemini.panicbnc.net")'
      ssl: true
    - name:     'undernet'
      address:  'Gemini.panicbnc.net/1338'
      password: 'echo alem0lars/undernet:$(lpass show --password "alem0lars @ gemini.panicbnc.net")'
      ssl: true
    - name:     'efnet'
      address:  'Gemini.panicbnc.net/1338'
      password: 'echo alem0lars/efnet:$(lpass show --password "alem0lars @ gemini.panicbnc.net")'
      ssl: true
    - name:     'espernet'
      address:  'Gemini.panicbnc.net/1338'
      password: 'echo alem0lars/espernet:$(lpass show --password "alem0lars @ gemini.panicbnc.net")'
      ssl: true
    - name:     'smashthestack'
      address:  'Gemini.panicbnc.net/1338'
      password: 'echo alem0lars/smashthestack:$(lpass show --password "alem0lars @ gemini.panicbnc.net")'
      ssl: true
    EOS
  end

  def configure_preferences
    default msg:    "Rejoin a channel after being kicked",
            domain: "com.codeux.apps.textual.plist",
            name:   "RejoinChannelOnLocalKick",
            value:  true
    default msg:    "Toggle away status on display sleep",
            domain: "com.codeux.apps.textual.plist",
            name:   "SetAwayOnScreenSleep",
            value:  true
    default msg:    "Connect to server on double click",
            domain: "com.codeux.apps.textual.plist",
            name:   "ServerListDoubleClickConnectServer",
            value:  true
    default msg:    "Disconnect from server on double click",
            domain: "com.codeux.apps.textual.plist",
            name:   "ServerListDoubleClickDisconnectServer",
            value:  true
    default msg:    "Join channel on double click",
            domain: "com.codeux.apps.textual.plist",
            name:   "ServerListDoubleClickJoinChannel",
            value:  true
    default msg:    "Leave channel on double click",
            domain: "com.codeux.apps.textual.plist",
            name:   "ServerListDoubleClickLeaveChannel",
            value:  true
    default msg:    "Save input history for each channel rather than globally",
            domain: "com.codeux.apps.textual.plist",
            name:   "SaveInputHistoryPerSelection",
            value:  true
    default msg:    "Darken main window colors",
            domain: "com.codeux.apps.textual.plist",
            name:   "InvertSidebarColors",
            value:  true
    default msg:    "Place known server staff member at top of user list",
            domain: "com.codeux.apps.textual.plist",
            name:   "MemberListSortFavorsServerStaff",
            value:  true
    default msg:    "Set window transparency",
            domain: "com.codeux.apps.textual.plist",
            name:   "MainWindowTransparencyLevel"
            value:  0.93
    default msg:    "Set theme",
            domain: "com.codeux.apps.textual.plist",
            name:   "Theme -> Name",
            value:  "resource:Simplified Dark"
    default msg:    "Show linked images inline with chat",
            domain: "com.codeux.apps.textual.plist",
            name:   "DisplayEventInLogView -> Inline Media",
            value:  true
    default msg:    "Set scrollback size",
            domain: "com.codeux.apps.textual.plist",
            name:   "ScrollbackMaximumLineCount",
            value:  8192
    default msg:    "Enable smiley converter",
            domain: "com.codeux.apps.textual.plist",
            name:   "Smiley Converter Extension -> Enable Service",
            value:  true
    default msg:    "Enable use of emoticons offered by www.emoji-cheat-sheet.com",
            domain: "com.codeux.apps.textual.plist",
            name:   "Smiley Converter Extension -> Enable Extra Emoticons",
            value:  true
    default msg:    "/away applies to all active connections",
            domain: "com.codeux.apps.textual.plist",
            name:   "ApplyCommandToAllConnections -> away",
            value:  true
    default msg:    "Send passive file transfer requests by default",
            domain: "com.codeux.apps.textual.plist",
            name:   "File Transfers -> File Transfer Requests Use Reverse DCC",
            value:  true
    default msg:    "Log transcript",
            domain: "com.codeux.apps.textual.plist",
            name:   "LogTranscript",
            value:  true
    default msg:    "Set default identity username",
            domain: "com.codeux.apps.textual.plist",
            name:   "DefaultIdentity -> Username",
            value:  data[:irc_username]
    default msg:    "Set default identity nickname",
            domain: "com.codeux.apps.textual.plist",
            name:   "DefaultIdentity -> Nickname",
            value:  data[:irc_username]
    default msg:    "Set default identity away nickname",
            domain: "com.codeux.apps.textual.plist",
            name:   "DefaultIdentity -> AwayNickname",
            value:  data[:irc_username]
    default msg:    "Set default identity realname",
            domain: "com.codeux.apps.textual.plist",
            name:   "DefaultIdentity -> Realname",
            value:  data[:fullname]
    default msg:    "Automatically start a private conversation when possible",
            domain: "com.codeux.apps.textual.plist",
            name:   "Off-the-Record Messaging -> Automatically Enable Service",
            value:  true
    custom msg:    "Set log transcript location to '~/Documents/IRC log'",
           manual: true
    custom msg:    "Set downloads location to '~/Downloads'",
           manual: true
  end
end
