require 'spec_helper'

RSpec.describe Address do
  subject { described_class.new(name: "Oceans", type_place: "Av", number: 12, merchant_id: 2)}

  it "is valid with all the attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a type_place" do
    subject.type_place = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a number" do
    subject.number = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a merchant_id" do
    subject.merchant_id = nil
    expect(subject).to_not be_valid
  end

end
