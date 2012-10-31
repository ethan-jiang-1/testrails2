# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  address    :string(255)
#  latitude   :float
#  longitude  :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string(255)
#

require File.dirname(__FILE__) + '/../spec_helper'

describe Location do
  describe "some record" do
    it "should be valid" do
      Location.new().should be_valid
      Location.new(:name=>"San Diego").should be_valid
      Location.new(:name=>"San Diego", :address=>"San Diego, CA").should be_valid
    end

  end
end
