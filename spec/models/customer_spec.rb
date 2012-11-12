# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  phone      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :integer
#

require 'spec_helper'


describe Customer do
  describe "some basics" do
    it "new methods from belongs_to" do
      #only a belongs_to inject to the model,  the model will support four operations below
      #association(force_reload = false)
      #association=(associate)
      #build_association(attributes = {})
      #create_association(attributes = {})

      o = FactoryGirl.create(:order)
      o.respond_to?(:customer).should be true
      o.respond_to?(:customer=).should be true
      o.respond_to?(:build_customer).should be true
      o.respond_to?(:create_customer).should be true

      c1 = o.create_customer(:name => "tom")
      #p c1
      c2 = o.build_customer(:name => "mary")
      #p c2         #built, no valid id yet before saving to DB
      c2.save!
      #p c2         #saved, and have valid id

      #Order.all.each {|x| p x}
      #Customer.all.each {|x| p x}

      cx1 = Customer.find_all_by_name(c1.name).first
      cx1.id.should be c1.id

      cx2 = Customer.find_all_by_name(c2.name).first
      cx2.id.should be c2.id

      #o.customer.id.should be cx1.id

    end
  end

  describe "relationship customer/oder" do
    it "query mode - single copy or multiple copies" do
      c1 = FactoryGirl.create(:customer)
      c2 = FactoryGirl.create(:customer)
      c3 = FactoryGirl.create(:customer)

      o1 = FactoryGirl.create(:order)
      o2 = FactoryGirl.create(:order)
      o3 = FactoryGirl.create(:order)

      c1.orders << o1
      c1.orders << o2
      c1.orders << o3

      cx = Customer.first
      ox = cx.orders.first

      #p cx
      #p ox

      #p cx.name == ox.customer.name
      ox.customer.name.should match cx.name
      cx.name = "mary"
      #p cx.name == ox.customer.name      #Yizhen: need to add :inverse_of in the model in_order to make sure cx share the same copy of ox.customer
      #ox.customer.name.should match cx.name
      pending "todo - Yizhen: still cannot make inverse_of to work - there will be two copy of instance due to the way we created the object #{__FILE__}"

    end
  end
end
