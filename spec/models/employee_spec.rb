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
    e1 = FactoryGirl.create(:employee)
    e11 = FactoryGirl.create(:employee)
    e12 = FactoryGirl.create(:employee)
    e13 = FactoryGirl.create(:employee)

    name1 = e1.name
    name13 = e13.name

    e1.subordinates << e11        #using subordinates to build up relationship between employee and manager
    e1.subordinates << e12
    e1.subordinates << e13


    e1sx = e1.subordinates.find_all   #using subordinates to query the set of employee under a manager
    #es1.each {|x| p x}
    e1sx.should include e11
    e1sx.should include e12
    e1sx.should include e13

    e1x  = Employee.find_all_by_name(name1).first
    e13x = Employee.find_all_by_name(name13).first

    e13xm = e13x.manager  #using .manager to access employee's manager
    #p e1x
    #p e13x
    #p e13xm
    e13xm.name.should match e1x.name
    e13xm.id.should be e1x.id

  end

end
