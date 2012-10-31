# == Schema Information
#
# Table name: employees
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  manager_id :integer
#

class Employee < ActiveRecord::Base
  attr_accessible :name
  has_many :pictures, :as => :imageable

  has_many :subordinates, :class_name => "Employee",  :foreign_key => "manager_id"
  belongs_to :manager, :class_name => "Employee"
end
