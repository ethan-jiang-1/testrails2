# == Schema Information
#
# Table name: orders
#
#  id          :integer          not null, primary key
#  track_no    :string(255)
#  details     :text
#  customer_id :integer
#  order_date  :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
