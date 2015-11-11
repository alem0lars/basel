require "spec_helper"

describe Basel::Target::Atomic do
  include_context :atomic_target

  describe "#match?" do
    subject { foo_target }

    context "when matching against a target with the same name" do
      it { expect(subject.match? foo_target).to be true }
    end

    context "when matching against a target with the different name" do
      it { expect(subject.match? bar_target).to be false }
    end
  end
end
