# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  phone      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Customer < ActiveRecord::Base
  attr_accessible :name, :phone, :company_id

  belongs_to :company

  has_many :orders, :inverse_of => :customer
end
