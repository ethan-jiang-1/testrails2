class PriceModel2 < ActiveRecord::Base
  acts_as_heir_of :price 
  attr_accessible :priceA, :priceB, :priceC
end
