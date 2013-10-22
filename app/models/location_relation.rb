# == Schema Information
#
# Table name: location_relations
#
#  id          :integer          not null, primary key
#  loc_from_id :integer
#  loc_to_id   :integer
#

class LocationRelation < ActiveRecord::Base

  attr_accessible :loc_from_id, :loc_to_id
end
