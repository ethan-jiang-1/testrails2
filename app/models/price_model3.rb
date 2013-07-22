class PriceModel3 < ActiveRecord::Base
  acts_as_heir_of :price 
  attr_accessible :priceX, :priceY
end
