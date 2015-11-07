require "spec_helper"

describe Basel::Logger do
  include_context :logger
  include_context :args

  describe "#log_warning" do
    context "when logging a warning without asking to continue" do
      let(:args) { [:warning, msg_0, ask_continue: false] }
      it { expect { log(*args_with(ig_ex: false)) }.to_not raise_error }
      it { expect_log(*args).to match_log_msg(msg_0) }
    end

    context "when asking to continue and user rejects" do
      let(:args) { [:warning, msg_0, ask_continue: true, input: "n"] }
      it { expect { log(*args_with(ig_ex: false)) }.to raise_error(SystemExit) }
      it { expect_log(*args).to match_log_msg(msg_abort) }
    end

    context "when asking to continue and user agrees" do
      let(:args) { [:warning, msg_0, ask_continue: true, input: "y"] }
      it { expect { log(*args_with(ig_ex: false)) }.to_not raise_error }
      it { expect_log(*args).to match_log_msg(msg_0) }
    end
  end

  describe "#log_error" do
    let(:args) { [:error, msg_0] }
    it { expect { log(*args_with(ig_ex: false)) }.to raise_error(SystemExit) }
    it { expect_log(*args).to match_log_msg(msg_abort) }
  end

  describe "#format_msg" do
    context "when formatting a message without any option" do
      subject { logger.format_msg msg_0 }
      it { is_expected.to eq(msg_0) }
    end

    context "when formatting a message with a prefix" do
      subject { logger.format_msg msg_0, prefix: prefix }
      it { is_expected.to eq("[#{prefix}] #{msg_0}") }
    end

    context "when formatting an indented message" do
      subject { logger.format_msg msg_0, indent: 2 }
      it { is_expected.to eq("\t\t#{msg_0}") }
    end

    context "when formatting a colored message" do
      subject { logger.format_msg msg_0, color: :magenta }
      it { is_expected.to eq(HighLine.color(msg_0, :magenta)) }
    end
  end
end
