module Basel
  # Provide logging capability to the including class.
  module Logger
    def log(msg, **args)
      say format_msg(msg, args)
    end

    def log_warning(msg, ask_continue: true, **args)
      pfx = args[:prefix] ? "⚠ #{args[:prefix]}" : nil
      msg = msg.end_phrase_with(".") + " Aborting!".underline if ask_continue

      say format_msg(msg, args.merge(color: :yellow, prefix: pfx))
      abort if ask_continue && !quiz("continue")
    end

    def log_error(msg, **args)
      pfx = args[:prefix] ? "☠ #{args[:prefix]}" : nil
      msg = msg.end_phrase_with(".") + " Aborting!"

      say format_msg(msg, args.merge(color: :red, prefix: pfx))
      abort
    end

    def format_msg(msg, prefix: nil, indent: 0, color: nil)
      msg =  ""
      msg << "\t" * indent # Add indentation.
      msg << msg.nil? ? prefix : "#{prefix} #{msg}" # Add message (and prefix).
      color.nil? ? msg : msg.color(color)
    end
  end
end
