# == Schema Information
#
# Table name: assemblies
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Assembly do
  it "should not allow empty name" do
    lambda { Assembly.create! }.should raise_error
  end

  it "should allow a valid name" do
    a1 = Assembly.create!(:name => "assembly1")
    Assembly.find_all_by_name("assembly1").size.should >= 1
    Assembly.find_all_by_name("assembly1").first.id.should equal a1.id
  end

  it "should keep the name unique" do
    lambda do
      Assembly.create!(:name => "assembly1")
      Assembly.create!(:name => "assembly1")
    end.should raise_error
  end
end
