# == Schema Information
#
# Table name: prices
#
#  id         :integer          not null, primary key
#  heir_id    :integer
#  heir_type  :string(255)
#  base_price :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Price < ActiveRecord::Base
  acts_as_predecessor
  attr_accessible :base_price
end
