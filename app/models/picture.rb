# == Schema Information
#
# Table name: pictures
#
#  id             :integer          not null, primary key
#  imageable_id   :integer
#  imageable_type :string(255)
#  uuid           :string(36)
#  image_type     :string(16)
#  store_type     :string(10)
#  store_uri      :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

#store_type :
#   pic_store       local
#   asset           path
#   external        url

class Picture < ActiveRecord::Base
  attr_accessible :uuid, :image_type, :store_type, :store_uri
  attr_accessible :imageable_id, :imageable_type
  belongs_to :imagable, :polymorphic => true
end
