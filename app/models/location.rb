# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Location < ActiveRecord::Base
  has_many :companies

  attr_accessible :name, :address, :latitude, :longitude
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?


  has_and_belongs_to_many :subordinates,
                          :class_name => "Location",
                          :join_table => "location_relations",
                          :association_foreign_key => "loc_from_id",
                          :foreign_key => "loc_to_id"


    validates_uniqueness_of :name

  #has_many :subordinates, :class_name => "LocationRelation",  :foreign_key => "loc_from_id"

end
