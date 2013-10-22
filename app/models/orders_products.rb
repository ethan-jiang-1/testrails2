# == Schema Information
#
# Table name: orders_products
#
#  id         :integer          not null, primary key
#  order_id   :integer
#  product_id :integer
#

class OrdersProducts < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  # attr_accessible :title, :body
end
