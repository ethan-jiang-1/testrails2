# == Schema Information
#
# Table name: employees
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Employee do
  it "should query back all the picture associated with the entity who has many pictures associated" do
    e1 = FactoryGirl.create(:employee)
    p1 = FactoryGirl.create(:picture)
    p2 = FactoryGirl.create(:picture)
    p3 = FactoryGirl.create(:picture)


    e1.pictures << p1
    e1.pictures << p2
    e1.pictures << p3


    e1.pictures.find_all.count.should be 3
    #px = e1.pictures.find_all.first
    #p px.

  end

  it "should have clear manager <-> subordinates relationship" do
    pending "todo: Yizhen ? how to make self-relation works?  #{__FILE__}"
  end

end
