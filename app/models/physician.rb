# == Schema Information
#
# Table name: physicians
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Physician < ActiveRecord::Base
  has_many :appointments
  has_many :patients, :through => :appointments

  attr_accessible :name
  validates_uniqueness_of :name
  validates_presence_of :name
end
