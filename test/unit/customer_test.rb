# == Schema Information
#
# Table name: customers
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  phone           :string(255)
#  phone_mobile    :string(255)
#  mailing_address :string(255)
#  email_address   :string(255)
#  social_info     :string(255)
#  company_id      :integer
#  picture_id      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
