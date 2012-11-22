# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  phone      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :integer
#

class Customer < ActiveRecord::Base
  attr_accessible :name, :phone, :company_id, :role_ids

  belongs_to :company
  has_and_belongs_to_many :roles

  has_many :orders, :inverse_of => :customer

  validates_presence_of :name
  validates_uniqueness_of :name
  #validates_format_of :phone, :with => /\(?\b([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})\b/i , :on => :create

end
