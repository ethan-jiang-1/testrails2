# == Schema Information
#
# Table name: orders
#
#  id          :integer          not null, primary key
#  order_date  :date
#  product     :string(255)
#  customer_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Order < ActiveRecord::Base
  belongs_to :customer, :inverse_of => :orders

  attr_accessible :product
  attr_accessible :order_date, :product
end
