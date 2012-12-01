# == Schema Information
#
# Table name: blob_pictures
#
#  id         :integer          not null, primary key
#  uuid       :string(32)
#  data       :binary(16777215)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BlobPicture < ActiveRecord::Base
  attr_accessible :data, :uuid
end
