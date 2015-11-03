module Basel
  # Provide logging capability to the including class.
  module Logger
    # TODO
    # def _log_step(msg, importance)
    #   log msg,
    #       case importance
    #       when :high   then ["Step `#{name}`", :magenta, 0]
    #       when :medium then ["➢",              :cyan,    1]
    #       when :low    then ["➢",              :white,   2]
    #       else log_error "Invalid step importance: #{importance}"
    #       end.zip(:prefix, :color, :indent).to_h
    # end

    def log_warning(msg, ask_continue: true, **args)
      continue = !ask_continue ||
                 agree("A warning has been issues. Do you want to continue?")
      pfx = args[:prefix] ? "⚠ #{args[:prefix]}" : nil
      msg = msg.dup
      msg.end_phrase_with!(".")
      msg << " " + HighLine.color("Aborting!", :underline) unless continue

      log msg, args.merge(color: :yellow, prefix: pfx)
      abort unless continue
    end

    def log_error(msg, **args)
      pfx = args[:prefix] ? "☠ #{args[:prefix]}" : nil
      msg = msg.dup
      msg.end_phrase_with!(".")
      msg << " " + HighLine.color("Aborting!", :underline)

      log msg, args.merge(color: :red, prefix: pfx)
      exit(false)
    end

    def log(msg, **args)
      say format_msg(msg, args)
    end

    def format_msg(msg, prefix: nil, indent: 0, color: nil)
      res =  ""
      res << "\t" * indent # Add indentation.
      res << (prefix.nil? ? msg : "[#{prefix}] #{msg}") # Add prefix & message.
      color.nil? ? res : HighLine.color(res, color)
    end
  end
end
