# == Schema Information
#
# Table name: patients
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Patient < ActiveRecord::Base
  has_many :appointments
  has_many :physicians, :through => :appointments
  attr_accessible :name

  validates_uniqueness_of :name
  validates_presence_of :name
end
