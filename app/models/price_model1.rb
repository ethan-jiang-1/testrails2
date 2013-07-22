class PriceModel1 < ActiveRecord::Base
  acts_as_heir_of :price 
  attr_accessible :price1, :price2, :price3, :price4, :price5
end
