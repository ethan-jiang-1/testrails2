# == Schema Information
#
# Table name: orders_products
#
#  id         :integer          not null, primary key
#  order_id   :integer
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class OrdersProducts < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  # attr_accessible :title, :body
end
