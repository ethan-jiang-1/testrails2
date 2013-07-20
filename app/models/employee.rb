# == Schema Information
#
# Table name: employees
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  manager_id :integer
#  email      :string(255)
#  phone      :string(255)
#  company_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Employee < ActiveRecord::Base
  attr_accessible :name, :email, :phone
  attr_accessible :manager_id, :company_id, :picture_ids

  has_many :pictures, :as => :imageable

  belongs_to :company

  has_many :subordinates, :class_name => "Employee",  :foreign_key => "manager_id"
  belongs_to :manager, :class_name => "Employee"
end
