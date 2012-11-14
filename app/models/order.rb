# == Schema Information
#
# Table name: orders
#
#  id          :integer          not null, primary key
#  track_no    :string(255)
#  details     :string(255)
#  customer_id :integer
#  order_date  :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Order < ActiveRecord::Base
  belongs_to :customer, :inverse_of => :orders

  attr_accessible :track_no
  attr_accessible :details
  attr_accessible :order_date
  attr_accessible :customer_id

  has_many :products
end
