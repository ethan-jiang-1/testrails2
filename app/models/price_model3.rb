# == Schema Information
#
# Table name: price_model3s
#
#  id         :integer          not null, primary key
#  priceX     :integer
#  priceY     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PriceModel3 < ActiveRecord::Base
  acts_as_heir_of :price 
  attr_accessible :priceX, :priceY
end
