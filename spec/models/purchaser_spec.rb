require 'spec_helper'

RSpec.describe Purchaser do
  subject { described_class.new(name: "Denis", surname: "Masunaga")}

  it "is valid with all the attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a surname" do
    subject.surname = nil
    expect(subject).to_not be_valid
  end
end
