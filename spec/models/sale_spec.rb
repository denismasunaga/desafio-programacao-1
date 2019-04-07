require 'spec_helper'

RSpec.describe Sale do
  subject { described_class.new(count: 2, total: 12.5, purchaser_id: 3, merchant_id: 2, item_id: 1)}

  it "is valid with all the attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a count" do
    subject.count = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a total" do
    subject.total = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a purchaser_id" do
    subject.purchaser_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a merchant_id" do
    subject.merchant_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a item_id" do
    subject.item_id = nil
    expect(subject).to_not be_valid
  end
end
