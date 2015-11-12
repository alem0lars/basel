#
# Generic utilities.
#
module Utils
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

  def ask(question, type: :string)
    question.strip!
    question += "?" unless ["?", "!", "."].any? { |e| question.end_with?(e) }
    question += " "
    $stdout.write(question)
    answer = $stdin.gets.strip
    case type
    when :bool
      if answer =~ /y|ye|yes|yeah|ofc/i
        true
      elsif answer =~ /n|no|fuck|fuck\s+you|fuck\s+off/i
        false
      else
        warning "Answer misunderstood.", ask_continue: false
        ask(question, type: type)
      end
    when :string
      if answer.empty?
        warning "Empty answer.", ask_continue: false
        ask(question, type: type)
      else
        answer
      end
    when :int   then Integer(answer)
    when :float then Float(answer)
    when :array then answer.split(/\s*,\s*/).map { |a| a.strip }
    when Array
      if type.include?(answer)
        answer
      else
        warning "Invalid answer.", ask_continue: false
        ask(question, type: type)
      end
    else
      error("Unhandled question type: `#{type}`.")
    end
  end

  def type_from_value(value)
    if value.is_a?(TrueClass) || value.is_a?(FalseClass) then :bool
    elsif value.is_a?(String) then :string
    elsif value.is_a?(Integer) then :int
    elsif value.is_a?(Float) then :float
    elsif value.is_a?(Array) then :array
    else error("Don't know how to handle `#{value.class}`.")
    end
  end

  def program_available?(cmd)
    command_success? "which '#{cmd}'"
  end

  def command_success?(cmd)
    `#{cmd}`
    $?.success?
  end
end
