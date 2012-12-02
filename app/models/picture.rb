# == Schema Information
#
# Table name: pictures
#
#  id             :integer          not null, primary key
#  imageable_id   :integer
#  imageable_type :string(255)
#  uuid           :string(36)
#  content_type   :string(16)
#  store_loc      :string(10)
#  store_uri      :string(255)
#  local_data     :binary(16777215)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

#store_uri varies based on store_loc (3 types) :
#   pic_store       original_name
#   asset           path to asset
#   external        url to resource

class Picture < ActiveRecord::Base
  attr_accessible :uuid, :content_type, :store_loc, :store_uri, :local_data
  attr_accessible :imageable_id, :imageable_type
  belongs_to :imagable, :polymorphic => true
end
