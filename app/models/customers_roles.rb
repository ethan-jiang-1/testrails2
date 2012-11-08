class CustomersRoles < ActiveRecord::Base
  belongs_to :customer
  belongs_to :role
  # attr_accessible :title, :body
end
