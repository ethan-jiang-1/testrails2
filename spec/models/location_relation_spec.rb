# == Schema Information
#
# Table name: location_relations
#
#  id          :integer          not null, primary key
#  loc_from_id :integer
#  loc_to_id   :integer
#

require 'spec_helper'

describe LocationRelation do
  describe "some record" do
    it "should be valid" do
      locSD = Location.create!(:name=>"San Diego", :address=>"San Diego, CA")
      locSF = Location.create!(:name=>"San Francisco", :address=>"San Francisco, CA")
      locLA = Location.create!(:name=>"Los Angeles", :address=>"Los Angeles, CA")
      locCA = Location.create!(:name=>"California", :address=>"California, USA.")
      locUS = Location.create!(:name=>"America", :address=>"United States of America")

      locUS.subordinates << locCA
      locCA.subordinates << locSD
      locCA.subordinates << locSF
      locCA.subordinates << locLA

      locUS.save!
      locCA.save!

    end
  end

end
