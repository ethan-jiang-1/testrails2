class Price < ActiveRecord::Base
  acts_as_predecessor
  attr_accessible :base_price
end
