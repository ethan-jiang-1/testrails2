# == Schema Information
#
# Table name: offer_state_transitions
#
#  id            :integer          not null, primary key
#  offer_id      :integer
#  event         :string(255)
#  from          :string(255)
#  to            :string(255)
#  state_message :string(255)
#  created_at    :datetime
#

require 'mp_user_traceable'

class OfferStateTransition < ActiveRecord::Base
  belongs_to :offer
  attr_accessible :created_at, :event, :from, :to
  attr_accessible :state_message 
  attr_accessible :offer_id
  attr_accessible :user_id


  trace_current_user
end
