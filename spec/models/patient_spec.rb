# == Schema Information
#
# Table name: patients
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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

    it "should allow a valid name" do
      p1 = Patient.create!(:name => "tom1")
      Patient.find_all_by_name("tom1").first.id.should be p1.id
    end

    it "should keep the name unique" do
      lambda do
        Patient.create!(:name => "tom1")
        Patient.create!(:name => "tom1")
      end.should raise_error

    end

  end

end
