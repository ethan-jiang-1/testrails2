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

require 'spec_helper'

describe Offer do
  pending "add some examples to (or delete) #{__FILE__}"
end
