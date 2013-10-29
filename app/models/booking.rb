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

  after_save :as_proc1
  after_save :as_proc2
  after_save :as_proc3

  def as_proc1
    puts "as_proc1"
    true 
  end 

  def as_proc2
    puts "as_proc2"
    false
  end 

  def as_proc3
    puts "as_proc3"
    true 
  end 

end
