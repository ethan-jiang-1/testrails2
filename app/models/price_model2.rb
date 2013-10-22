# == Schema Information
#
# Table name: price_model2s
#
#  id         :integer          not null, primary key
#  priceA     :integer
#  priceB     :integer
#  priceC     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PriceModel2 < ActiveRecord::Base
  acts_as_heir_of :price 
  attr_accessible :priceA, :priceB, :priceC
end
