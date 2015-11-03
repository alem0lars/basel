shared_context :logger do
  let(:logger) { Class.new { include Basel::Logger }.new }

  let(:abr) { HighLine.color("Aborting!", :underline) }
end
