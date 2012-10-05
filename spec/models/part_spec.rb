# == Schema Information
#
# Table name: parts
#
#  id         :integer          not null, primary key
#  part_name  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Part do
  it "should not allow empty name" do
    lambda { Part.create! }.should raise_error
  end

  it "should allow a valid name" do
    p1 = Part.create!(:part_name => "part1")
    Part.find_all_by_part_name("part1").first.id.should be p1.id
  end

  it "should keep the name unique" do
    lambda do
      Part.create!(:part_name => "part1")
      Part.create!(:part_name => "part1")
    end.should raise_error
  end
end
