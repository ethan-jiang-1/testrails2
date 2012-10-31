# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  address    :string(255)
#  latitude   :float
#  longitude  :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string(255)
#

class Location < ActiveRecord::Base
  attr_accessible :name, :address, :latitude, :longitude
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?


  has_and_belongs_to_many :subordinates,
                          :class_name => "Location",
                          :join_table => "location_relations",
                          :association_foreign_key => "loc_from_id",
                          :foreign_key => "loc_to_id"


  #has_many :subordinates, :class_name => "LocationRelation",  :foreign_key => "loc_from_id"

end
