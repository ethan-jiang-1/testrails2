# == Schema Information
#
# Table name: physicians
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Physician do
  describe "create few Physician" do

    it "should have name specified"  do
      begin
        ph1 = Physician.create!
      rescue Exception => e
      end
      Physician.count.should be 0
    end

    it "should allow a valid name" do
      p1 = Physician.create!(:name => "tom1")
      Physician.find_all_by_name("tom1").first.id.should be p1.id
    end

    it "should have unique name " do
      begin
        ph1 = Physician.create!(:name => "Dr. tom")
        ph2 = Physician.create!(:name => "Dr. tom")
      rescue Exception => e
      end

      Physician.count.should be 1
    end

    it "should have some patients in table" do
      ph1 = Physician.create!(:name => "Dr. tom")
      ph2 = Physician.create!(:name => "Dr. mark")
      ph3 = Physician.create!(:name => "Dr. sue")

      Physician.count.should be 3
    end



  end
end
