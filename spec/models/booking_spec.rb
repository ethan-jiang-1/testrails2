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
  it "try book save" do
  	booking = FactoryGirl.create(:booking, :state => :incomplete)

  	booking.what = "aaa"
  	booking.save!
  end 
end
