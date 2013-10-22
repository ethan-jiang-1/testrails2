# == Schema Information
#
# Table name: currency_numbers
#
#  id         :integer          not null, primary key
#  float1     :float
#  float2     :float
#  decimal1   :decimal(10, 2)
#  decimal2   :decimal(10, 2)
#  integer1   :integer
#  integer2   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CurrencyNumber < ActiveRecord::Base
  attr_accessible :decimal1, :decimal2, :float1, :float2, :integer1, :integer2
end
