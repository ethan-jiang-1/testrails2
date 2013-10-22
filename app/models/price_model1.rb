# == Schema Information
#
# Table name: price_model1s
#
#  id         :integer          not null, primary key
#  price1     :integer
#  price2     :integer
#  price3     :integer
#  price4     :integer
#  price5     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PriceModel1 < ActiveRecord::Base
  acts_as_heir_of :price 
  attr_accessible :price1, :price2, :price3, :price4, :price5
end
