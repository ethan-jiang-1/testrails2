# == Schema Information
#
# Table name: gmap_users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  address    :string(255)
#  latitude   :float
#  longitude  :float
#  gmaps      :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GmapUser < ActiveRecord::Base
  attr_accessible :address, :gmaps, :latitude, :longitude, :name

  acts_as_gmappable

  def gmaps4rails_address
    address
  end

end
