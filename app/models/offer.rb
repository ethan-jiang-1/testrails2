# == Schema Information
#
# Table name: offers
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  state           :string(255)
#  state_message   :string(255)
#  price_per_night :integer
#  price_from_mmc  :integer
#  price_from_opr  :integer
#  comment         :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'mp_auditable'

#require 'mp_user_tracer'
#trace_current_user

class Offer < ActiveRecord::Base
  has_many :offer_state_transitions
  #audited only: [:price_per_night]	
  audit :price_per_night


  attr_accessible :offer_id
  attr_accessible :comment, :name, :price_from_mmc, :price_from_opr, :price_per_night

  attr_accessible :state, :state_message

  state_machine initial: :new do
  	#store_audit_trail
  	store_audit_trail :context_to_log => :state_message
    event :purchase do
      transition :new => :open
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
  end 
  
end
