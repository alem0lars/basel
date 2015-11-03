require "spec_helper"

describe Basel::Logger do
  include_context :logger

  let(:pfx) { "COOL" }
  let(:msg) { "You can't blame gravity for falling in love" }

  describe "#log_warning" do
    after { $stdin = STDIN }

    context "when logging a warning without asking to continue" do
      let(:expected_output) { HighLine.color(msg, :yellow) + "\n" }
      subject { -> { logger.log_warning msg, ask_continue: false } }
      it { is_expected.to output(expected_output).to_stdout }
    end

    context "when asking to continue and user rejects" do
      before { $stdin = StringIO.new("y") }
      let(:expected_output) { HighLine.color("#{msg} #{abr}", :yellow) + "\n" }
      subject { -> { logger.log_warning msg, ask_continue: true } }
      it { is_expected.to output(expected_output).to_stdout.and raise_error }
    end

    context "when asking to continue and user agrees" do
      before { $stdin = StringIO.new("n") }
      let(:expected_output) { HighLine.color(msg, :yellow) + "\n" }
      subject { -> { logger.log_warning msg, ask_continue: true } }
      it { is_expected.to output(expected_output).to_stdout }
    end
  end

  describe "#log_error" do
    subject { -> { logger.log_error msg } }
    let(:expected_output) { HighLine.color("#{msg} #{abr}", :red) + "\n" }
    it { is_expected.to output(expected_output).to_stdout.and raise_error }
  end

  describe "#format_msg" do
    context "when formatting a message without any option" do
      subject { logger.format_msg msg }
      it { is_expected.to eq(msg) }
    end
    context "when formatting a message with a prefix" do
      subject { logger.format_msg msg, prefix: pfx }
      it { is_expected.to eq("[#{pfx}] #{msg}") }
    end
    context "when formatting an indented message" do
      subject { logger.format_msg msg, indent: 2 }
      it { is_expected.to eq("\t\t#{msg}") }
    end
    context "when formatting a colored message" do
      subject { logger.format_msg msg, color: :magenta }
      it { is_expected.to eq(HighLine.color(msg, :magenta)) }
    end
  end
end
