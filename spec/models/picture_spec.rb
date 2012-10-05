# == Schema Information
#
# Table name: pictures
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  imageable_id   :integer
#  imageable_type :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'spec_helper'

describe Picture do
  it "should query back all the picture associated with the entity who has many pictures associated" do
    e1 = FactoryGirl.create(:employee)
    p1 = FactoryGirl.create(:picture)
    p2 = FactoryGirl.create(:picture)
    p3 = FactoryGirl.create(:picture)

    e1.pictures << p1
    e1.pictures << p2
    e1.pictures << p3

    pd1 = FactoryGirl.create(:product)
    p4 = FactoryGirl.create(:picture)
    p5 = FactoryGirl.create(:picture)
    p6 = FactoryGirl.create(:picture)


    pd1.pictures << p4
    pd1.pictures << p5
    pd1.pictures << p6


    e1.pictures.find_all.count.should be 3

    #exl = pd1.pictures.find_all
    #exl.count.should be 3
    #exl.each {|x| p x}

    pd1.pictures.find_all.count.should be 3

    pending "todo - still cannot make query om imagable to work - to get where the picture point to (employee or product)"
    #px = pd1.pictures.find_all.first
    #p px
    #p pd1

    #p px.imageable

    #pd1.name.should match px.imageable_type

    #pil = Picture.imageable
    #pil.each {|x| p x}

    #Picture.imageable.count should be 6
    #px = e1.pictures.find_all.first
    #p px.

  end
end
