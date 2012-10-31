# == Schema Information
#
# Table name: location_relations
#
#  loc_from_id :integer
#  loc_to_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class LocationRelation < ActiveRecord::Base

  attr_accessible :loc_from_id, :loc_to_id
end
