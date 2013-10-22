# == Schema Information
#
# Table name: booking_state_transitions
#
#  id            :integer          not null, primary key
#  booking_id    :integer
#  event         :string(255)
#  from          :string(255)
#  to            :string(255)
#  state_message :string(255)
#  created_at    :datetime
#

require 'spec_helper'

describe BookingStateTransition do
  pending "add some examples to (or delete) #{__FILE__}"
end
