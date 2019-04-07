class Purchaser < ActiveRecord::Base
  validates_presence_of :name, :surname
end
