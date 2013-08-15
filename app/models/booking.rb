class Booking < ActiveRecord::Base
  attr_accessible :state, :what
  attr_accessible :state_message
  has_many :booking_state_transitions

  scope :open_bookings, -> { with_state(:open) }
  attr_accessor :invalid_payment

  state_machine initial: :incomplete do
  	#store_audit_trail
  	store_audit_trail :context_to_log => :state_message
    event :purchase do
      transition :incomplete => :open
    end

    event :cancel do
      transition :open => :canceled
    end

    event :resume do
      transition :canceled => :open
    end

    event :ship do
      transition :open => :shipped
    end

    before_transition :incomplete => :open do |booking|
      # process payment ...
      !booking.invalid_payment
    end
  end

end
