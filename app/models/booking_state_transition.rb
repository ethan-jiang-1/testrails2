# == Schema Information
#
# Table name: booking_state_transitions
#
#  id            :integer          not null, primary key
#  booking_id    :integer
#  user_id       :integer
#  event         :string(255)
#  from          :string(255)
#  to            :string(255)
#  state_message :string(255)
#  created_at    :datetime
#

require 'mp_user_traceable'


class BookingStateTransition < ActiveRecord::Base
  belongs_to :booking
  belongs_to :user 
  attr_accessible :created_at, :event, :from, :to
  attr_accessible :state_message
  attr_accessible :booking_id
  attr_accessible :user_id 

  trace_current_user
  
end
