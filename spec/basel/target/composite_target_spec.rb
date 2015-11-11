require "spec_helper"

describe Basel::Target::Composite do
  include_context :composite_target

  describe "#match?" do
    subject { foobarbaz_deep_target }

    context "when matching against the same target" do
      it { expect(subject.match? foobarbaz_deep_target).to be true }
    end

    context "when matching against the same target but flat (non-deep)" do
      it { expect(subject.match? foobarbaz_target).to be true }
    end

    context "when matching against a child" do
      it { expect(subject.match? foo_target)   .to be true }
      it { expect(subject.match? bar_target)   .to be true }
      it { expect(subject.match? baz_target)   .to be true }
      it { expect(subject.match? foobar_target).to be true }
      it { expect(subject.match? foobaz_target).to be true }
    end

    context "when dismatching against another different target" do
      it { expect(subject.match? cafe_target)    .to be false }
      it { expect(subject.match? baby_target)    .to be false }
      it { expect(subject.match? cafebaby_target).to be false }
    end
  end
end
