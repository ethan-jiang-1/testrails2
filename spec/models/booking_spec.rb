# == Schema Information
#
# Table name: bookings
#
#  id            :integer          not null, primary key
#  what          :string(255)
#  state         :string(255)
#  state_message :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'spec_helper'

describe Booking do
  pending "add some examples to (or delete) #{__FILE__}"
end
