# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
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
