# == Schema Information
#
# Table name: pictures
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  imageable_id   :integer
#  imageable_type :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Picture < ActiveRecord::Base
  attr_accessible :name
  belongs_to :imagable, :polymorphic => true
end
