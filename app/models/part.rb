# == Schema Information
#
# Table name: parts
#
#  id         :integer          not null, primary key
#  part_name  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Part < ActiveRecord::Base
  attr_accessible :part_name

  has_and_belongs_to_many :assemblies
  validates_uniqueness_of :part_name
  validates_presence_of :part_name
end
