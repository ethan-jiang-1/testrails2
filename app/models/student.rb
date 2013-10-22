# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  course     :string(255)
#  duratoin   :integer
#  day_job    :string(255)
#  type       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  attr_accessible :course, :day_job, :duratoin, :name, :type
end
