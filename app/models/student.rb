class Student < ActiveRecord::Base
  attr_accessible :course, :day_job, :duratoin, :name, :type
end
