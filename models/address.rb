class Address < ActiveRecord::Base
  validates_presence_of :name, :type_place, :number, :merchant_id
  belongs_to :merchant
end
