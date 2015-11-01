module Basel
  module Logger
    def info(prefix, msg = nil)
      if msg.nil?
        puts("#{prefix}")
      else
        puts("#{prefix} #{msg}")
      end
    end

    def warning(msg, ask_continue: true)
      puts("⚠ #{msg}")
      exit(-1) if ask_continue && !quiz('continue')
    end

    def error(msg)
      puts("☠ #{msg}")
      exit(-1)
    end
  end
end
