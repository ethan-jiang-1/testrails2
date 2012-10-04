require 'spec_helper'

describe Patient do

  describe "create few patients" do

    it "should have some patients in table" do
      p1 = Patient.create!(:name => "tom")
      p2 = Patient.create!(:name => "mark")
      p3 = Patient.create!(:name => "sue")

      expect(Patient.count).to eq(3)
    end
  end

  pending "add some examples to (or delete) #{__FILE__}"
end
