# == Schema Information
#
# Table name: offers
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  price_per_night :integer
#  price_from_mmc  :integer
#  price_from_opr  :integer
#  comment         :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Offer < ActiveRecord::Base
  #audited only: [:price_per_night]	
  audit :price_per_night
  has_paper_trail :class_name => 'OfferVersion', :only => [:price_per_night]

  attr_accessible :comment, :name, :price_from_mmc, :price_from_opr, :price_per_night
end
