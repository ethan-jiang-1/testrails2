# == Schema Information
#
# Table name: customers_roles
#
#  id          :integer          not null, primary key
#  customer_id :integer
#  role_id     :integer
#

class CustomersRoles < ActiveRecord::Base
  belongs_to :customer
  belongs_to :role
  # attr_accessible :title, :body
end
