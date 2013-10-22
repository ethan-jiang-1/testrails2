# == Schema Information
#
# Table name: companies
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  location_id :integer
#  picture_id  :integer
#

class Company < ActiveRecord::Base
  attr_accessible :name, :location_id, :picture_id
  has_many :customers
  belongs_to :location
  belongs_to :picture

  validates_uniqueness_of :name
end
