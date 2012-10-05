require 'spec_helper'

describe Patient do

  describe "create few patients" do

    it "should query out an entity just created " do
      p1 = Patient.create!(:name => "tom")
      p2 = Patient.find_by_name("tom")

      p1.name.should match p2.name
    end

    it "should not allow empty name" do
      lambda { Patient.create! }.should raise_error
    end

    it "should keep the name unique" do
      lambda do
        Patient.create!(:name => "tom1")
        Patient.create!(:name => "tom1")
      end.should raise_error

    end

  end

end
