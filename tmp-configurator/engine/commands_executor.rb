require "engine/utils"
require "engine/erb_renderer"

#
# Declare and execute commands.
#
class CommandsExecutor
  include Utils

  def initialize
    @commands = []
  end

  #
  # Execute all of the declared commands.
  #
  # Note: For commands declaration see the DSL below.
  #
  def execute_commands(dryrun)
    info dryrun ? "Commands are:" : "Executing commands.."
    @commands.each do |command|
      info command[:msg] if command[:msg]
      if command[:cmd]
        command[:cmd] = "sudo #{command[:cmd]}" if command[:root]
        if dryrun
          info "->", command[:cmd]
        else
          system command[:cmd]
        end
      elsif command[:lambda]
        if dryrun
          info "->", "...function..."
        else
          command[:lambda].call
        end
      end
      if command[:manual]
        if dryrun
          info "->", "Command requires manual confirmation."
        else
          ask "Manual step. Type 'continue' when you're done..",
              type: %w(c cont continue)
        end
      end
    end
  end

  # DSL ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  def startupitem_add(path: nil, hidden: false)
    error "Missing `path`." if path.nil?
    error "Invalid path: `#{path}`." unless File.file? path
    error "Missing `hidden`." if hidden.nil?

    applescript desc: "Add Startup Item `#{path}` (hidden=`#{hidden}`)."
                code: 'tell application "System Events" to make login item at end with properties {path:"' + item + '", hidden:' + hidden + '}'
  end

  def startupitem_add(item: nil)
    error "Missing `item`." if item.nil?

    applescript desc: "Remove Startup Item `#{item}`."
                code: 'tell application "System Events" to delete login item "' + item + '"'
  end

  def startupitem_list
    applescript desc: "List Startup Items"
                code: 'tell application "System Events" to get the name of every login item'
  end

  def applescript(desc: nil, code: nil, root: false, manual: false)
    error "Missing `desc`." if desc.nil?
    error "Missing `code`." if code.nil?

    @commands << {
      msg: "Running AppleScript: `#{desc}`.",
      cmd: "osascript -e '#{code}'",
      root: root,
      manual: manual
    }
  end

  def custom(msg: nil, cmd: "", root: false, manual: false)
    error "Missing `cmd`." if cmd.nil?

    @commands << { msg: msg, cmd: cmd, root: root, manual: manual }
  end

  def replace(src: nil, dst: nil, root: false)
    error "Missing `src`." if src.nil?
    error "Missing `dst`." if dst.nil?
    src = File.expand_path src
    dst = File.expand_path(dst), File.basename(src)

    @commands << {
      msg:    "Replace `#{dst}`.",
      cmd:    "rm \"#{dst}\" ; cp -a \"#{src}\" \"#{dst}\"", # TODO: atm as root it doesn't work (because of redirection `&&`).
      root:   root
    }
  end

  def lpass_save_note(name: nil, path: nil, root: false)
    error "Missing `name`." if name.nil?
    error "Missing `path`." if path.nil?
    path = File.expand_path path

    @commands << {
      msg:    "Save lastpass note `#{name}` to `#{path}`.",
      cmd:    "lpass show --notes \"#{name}\" > \"#{path}\"", # TODO: atm as root it doesn't work (because of redirection `>`).
      root:   root
    }
  end

  def download(url: nil, open: false, root: false, manual: false)
    error "Missing `url`." if url.nil?

    Array(url).each do |url|
      name = File.basename(url)
      download_cmd = "curl -L \"#{url}\" > \"#{name}\""
      open_cmd = "open \"#{name}\""
      @commands << {
        msg:    "Download #{open ? "(and open)" : nil} `#{name}` (using url: `#{url}`).",
        cmd:    open ? "#{download_cmd} && #{open_cmd}" : download_cmd, # TODO: atm as root it doesn't work (because of concat `&&`).
        root:   root,
        manual: manual
      }
    end
  end

  def npm_install(pkg: nil)
    error "Missing `pkg`." if pkg.nil?

    Array(pkg).each do |pkg|
      unless command_success? "[[ $(npm list -g --depth=0 | grep '#{pkg}@' | wc -l) -ge 1 ]]"
        @commands << {
          msg:  "Install nodejs package: `#{pkg}`.",
          cmd:  "npm install -g #{pkg}",
          root: false
        }
      end
    end
  end

  def gem_install(pkg: nil, user: false)
    error "Missing `pkg`." if pkg.nil?

    Array(pkg).each do |pkg|
      unless command_success? `gem list -i \"#{pkg}\"`
        cmd =  "gem install"
        cmd << " --user-install" if user
        cmd << " #{pkg}"
        @commands << {
          msg:  "Install gem `#{pkg}` (#{user ? "user-level" : "system-wide"}).",
          cmd:  cmd,
          root: !user
        }
      end
    end
  end

  def appstore(action: nil, name: nil)
    error "Missing `action`." if action.nil?
    error "Missing `name`."   if name.nil?

    @commands << {
      msg:    "Perform `#{action}` for `#{name}` in Mac App Store.",
      cmd:    "",
      manual: true
    }
  end

  def brew_upgrade(root: false)
    @commands << {
      msg:  "Perform brew update and upgrade.",
      cmd:  "brew update && brew upgrade", # TODO: atm as root it doesn't work (because of concat `&&`).
      root: root
    }
  end

  def brew_doctor(root: false)
    @commands << {
      msg:    "Perform brew doctor.",
      cmd:    "brew doctor",
      root:   root,
      manual: true
    }
  end

  def brew_tap(repo: nil, root: false)
    error "Missing `repo`." if repo.nil?

    @commands << {
      msg:  "Add repository `#{repo}`.",
      cmd:  "brew tap \"#{repo}\" && brew tap --repair",
      root: root
    }
  end

  def brew_install(pkg: nil, cask: false, opts: nil, appdir: "/Applications", root: false)
    error "Missing `pkg`." if pkg.nil?

    Array(pkg).each do |pkg|
      unless command_success? "brew #{cask ? "cask" : nil} ls --versions \"#{pkg}\""
        if cask
          cmd = "brew cask install \"#{pkg}\""
          cmd << " --appdir=\"#{appdir}\"" unless appdir.nil?
        else
          cmd = "brew install \"#{pkg}\""
        end
        cmd << " " + Array(opts).join(" ") if opts
        @commands << {
          msg:  "Install package `#{pkg}`.",
          cmd:  cmd,
          root: root
        }
      else
        @commands << {
          msg:  "Package `#{pkg}` is already installed.",
          cmd:  "",
          root: root
        }
      end
    end
  end

  def fizzy(repo: nil, cfg: nil, inst: nil, meta: nil, vars: nil, root: false)
    error "Missing `repo`." if repo.nil?
    error "Missing `cfg`."  if cfg.nil?
    error "Missing `inst`." if inst.nil?
    error "Missing `meta`." if meta.nil?
    error "Missing `vars`." if vars.nil?

    @commands << {
      msg:  "Fizzy sync (configuration: `#{cfg}`, url `#{repo}`).",
      cmd:  "fizzy cfg sync -c \"#{cfg}\" -u \"#{repo}\"",
      root: root
    }
    @commands << {
      msg:  "Fizzy quick install (configuration: `#{cfg}`, instance `#{inst}`).",
      cmd:  "fizzy qi -c \"#{cfg}\" -i \"#{inst}\" -m \"#{meta}\" -v \"#{vars}\"",
      root: root
    }
  end

  def chmod(mode: nil, path: nil, recursive: false, root: false)
    error "Missing `mode`." if mode.nil?
    error "Missing `path`." if path.nil?

    Array(path).each do |path|
      @commands << {
        msg:  "Change mode of `#{path}` to `#{mode}`.",
        cmd:  "chmod #{recursive ? "-R" : nil} #{mode} \"#{File.expand_path path}\"",
        root: root
      }
    end
  end

  def mkdir(msg: nil, path: nil, root: false)
    error "Missing `path`." if path.nil?

    Array(path).each do |path|
      @commands << {
        msg:  msg,
        cmd:  "mkdir -p \"#{File.expand_path path}\"",
        root: root
      }
    end
  end

  def syssetup(name: nil, value: nil, question: nil, msg: nil)
    error "Missing `name`."                if name.nil?
    error "Missing `value` or `question`." if value.nil? && question.nil?
    value = ask question                   unless question.nil?

    Array(name).each do |name|
      @commands << {
        msg:  msg,
        cmd:  "systemsetup -#{name} \"#{value}\"",
        root: true
      }
    end
  end

  def plist(msg: nil, cmd: nil, path: nil, root: false)
    error "Missing `cmd`."  if cmd.nil?
    error "Missing `path`." if path.nil?

    Array(cmd).each do |cmd|
      @commands << {
        msg:  msg,
        cmd:  "/usr/libexec/PlistBuddy -c \"#{cmd}\" \"#{File.expand_path path}\"",
        root: root
      }
    end
  end

  def sysconfig(msg: nil, name: nil, value: nil, question: nil)
    error "Missing `name`."                if name.nil?
    error "Missing `value` or `question`." if value.nil? && question.nil?
    value = ask question                   unless question.nil?

    Array(name).each do |name|
      @commands << {
        msg:  msg,
        cmd:  "scutil --set \"#{name}\" \"#{value}\"",
        root: true
      }
    end
  end

  def default(msg: nil, domain: :global, name: nil, value: nil, question: nil,
              type: nil, root: false)
    error "Missing `name`."               if name.nil?
    error "Missing `domain`."             if domain.nil?
    error "Missing `name` or `question`." if value.nil? && question.nil?
    domain = "NSGlobalDomain" if domain == :global
    value  = type.nil? ? ask(question) : ask(question, type: type) if question
    type   = type_from_value value if type.nil?
    error "Unknown type `#{type}`." unless %i(string bool int float array).include?(type)
    value = type == :array ? value.map{ |v| "\"#{v}\"" }.join(" ") : "\"#{value}\""

    Array(name).each do |name|
      @commands << {
        msg:  msg,
        cmd:  "defaults write \"#{domain}\" \"#{name}\" -#{type} #{value}",
        root: root
      }
    end
  end

  def file(msg: nil, path: nil, content: nil, context: {})
    error "Missing `path`."    if path.nil?
    error "Missing `content`." if content.nil?

    @commands << {
      msg: msg,
      func: lambda { ErbRenderer.render_from_hash content, context }
    }
  end

  # ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
end
