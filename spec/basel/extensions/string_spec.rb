require "spec_helper"

describe String do
  describe "#phrase_end_signs" do
    subject { described_class.phrase_end_signs }
    it { is_expected.to include "!", "?", "." }
  end

  describe "#phrase_ended?" do
    subject { "foobar?!" }
    it { expect(subject.phrase_ended? "!").to be true  }
    it { expect(subject.phrase_ended? "?").to be false }
    it { expect(subject.phrase_ended?)    .to be true  }
  end

  describe "#end_phrase_with!" do
    context "when the phrase is already ended" do
      subject { "foobar.!!?." }
      it { expect(subject.end_phrase_with! ".").to eq "foobar." }
      it { expect(subject.end_phrase_with! "!").to eq "foobar!" }
    end

    context "when the phrase isn't already ended" do
      subject { "foobar" }
      it { expect(subject.end_phrase_with! ".").to eq "foobar." }
    end
  end

  describe "#add_word" do
    subject { "foobar" }

    context "when argument is `nil` or empty" do
      it { expect(subject.add_word nil).to eq "foobar" }
      it { expect(subject.add_word "") .to eq "foobar" }
    end

    context "when argument is provided" do
      it { expect(subject.add_word "bazbaz").to eq "foobar bazbaz" }
    end
  end

  describe "#delete_ansi_colors" do
    subject { HighLine.color("foobar", :yellow, :underline) }
    it { expect(subject.delete_ansi_colors).to eq "foobar" }
  end
end
