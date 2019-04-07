require 'spec_helper'

RSpec.describe Item do
  subject { described_class.new(description: "cool item", price: 12.45, merchant_id: 2)}

  it "is valid with all the attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a description" do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a price" do
    subject.price = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a merchant_id" do
    subject.merchant_id = nil
    expect(subject).to_not be_valid
  end
end
