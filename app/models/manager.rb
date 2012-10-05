# == Schema Information
#
# Table name: managers
#
#  id          :integer          not null, primary key
#  employee_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Manager < ActiveRecord::Base
  belongs_to :employee
  # attr_accessible :title, :body
end
