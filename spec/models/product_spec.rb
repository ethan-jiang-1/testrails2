# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  category   :string(255)
#  price      :float
#

require 'spec_helper'

describe Product do
  it "should query back all the picture associated with the entity who has many pictures associated" do
    pd1 = FactoryGirl.create(:product)
    p1 = FactoryGirl.create(:picture)
    p2 = FactoryGirl.create(:picture)
    p3 = FactoryGirl.create(:picture)


    pd1.pictures << p1
    pd1.pictures << p2
    pd1.pictures << p3


    pd1.pictures.find_all.count.should be 3
  end
end
