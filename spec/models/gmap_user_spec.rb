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

require 'spec_helper'

describe GmapUser do
  pending "add some examples to (or delete) #{__FILE__}"
end
