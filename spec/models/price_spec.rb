# == Schema Information
#
# Table name: prices
#
#  id         :integer          not null, primary key
#  heir_id    :integer
#  heir_type  :string(255)
#  base_price :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Price do
  pending "add some examples to (or delete) #{__FILE__}"
end
