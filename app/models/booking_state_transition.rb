class BookingStateTransition < ActiveRecord::Base
  belongs_to :booking
  attr_accessible :created_at, :event, :from, :to
  attr_accessible :state_message
  attr_accessible   :booking_id
end
