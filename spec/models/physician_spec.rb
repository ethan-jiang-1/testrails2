require 'spec_helper'

describe Physician do
  describe "create few Physician" do

    it "should have name specified"  do
      begin
        ph1 = Physician.create!
      rescue Exception => e
        p e
      end
      Physician.count.should be 0
    end

    it "should have unique name " do
      begin
        ph1 = Physician.create!(:name => "Dr. tom")
        ph2 = Physician.create!(:name => "Dr. tom")
      rescue Exception => e
        p e
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
