class Item < ActiveRecord::Base
  validates_presence_of :description, :price, :merchant_id
  belongs_to :merchant
end
