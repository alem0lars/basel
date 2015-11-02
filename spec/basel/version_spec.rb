require "spec_helper"

describe Basel::Version do
  it "is compliant with the semver format" do
    expect(described_class::FULL).to match(/[0-9]+\.[0-9]+\.[0-9]+/)
  end

  it "has positive components" do
    %i(MAJOR MINOR PATCH).each do |component|
      expect(described_class.const_get(component)).to be_a(Integer).and be >= 0
    end
  end
end
