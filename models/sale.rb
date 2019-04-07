class Sale < ActiveRecord::Base
  validates_presence_of :count, :total, :purchaser_id, :merchant_id, :item_id
  belongs_to :merchant
  belongs_to :purchaser
  belongs_to :item
end
