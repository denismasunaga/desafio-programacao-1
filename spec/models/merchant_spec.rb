require 'spec_helper'

RSpec.describe Merchant do
  subject { described_class.new(name: "Valve Corp")}

  it "is valid with all the attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
