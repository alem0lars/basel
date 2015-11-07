shared_context :logger do
  include_context :highline

  let(:logger) { Class.new { include Basel::Logger }.new }

  # Some testing strings ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
  let(:prefix)    { "COOL" }                                                 # ┃
  let(:msg_0)     { "You can't blame gravity for falling in love." }         # ┃
  let(:msg_abort) { "#{msg_0} Aborting!" }                                   # ┃
  # ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

  # Call a log method.
  def log(name, *args, **kwargs)
    Array(kwargs.delete :input).each { |input| provide_input input }
    ignore_exit = kwargs.delete(:ig_ex) { true }
    begin
      logger.send("log_#{name}".to_sym, *args, **kwargs)
    rescue SystemExit => e
      raise e unless ignore_exit
    end
    true
  end

  # Create expectation for the current log output, removing ANSI colors escapes
  # and whitespaces/newlines from output.
  def expect_log(*args, **kwargs)
    expect(log(*args, **kwargs) && consume_output.delete_ansi_colors.chomp)
  end

  # Match a log message, without considering its (optional) prefix.
  def match_log_msg(msg)
    match(/^(\[.+\])?\s*#{Regexp.escape(msg)}\s*$/)
  end
end

shared_context :highline do
  let!(:input) { StringIO.new }
  before { $terminal.instance_variable_set :@input, input }

  let!(:output) { StringIO.new }
  before { $terminal.instance_variable_set :@output, output }

  def provide_input(text)
    input << "#{text}\n"
    input.rewind
  end

  def consume_output
    text = output.string.dup
    output.truncate output.rewind
    text
  end
end
