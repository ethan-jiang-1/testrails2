# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)


#Roles
print "[testrails2:db:seed]: roles\n"
r1 = Role.create(:name => "role 1")
r2 = Role.create(:name => "role 2")
r3 = Role.create(:name => "role 3")
r4 = Role.create(:name => "role 4")
r5 = Role.create(:name => "role 5")
r6 = Role.create(:name => "role 6")
r7 = Role.create(:name => "role 7")
r8 = Role.create(:name => "role 8")
r9 = Role.create(:name => "role 9")

#Locattions
print "[testrails2:db:seed]: locations\n"
l1 = Location.create( :name => "Loc b1",  :address => "tiananmen, beijing" )
l2 = Location.create( :name => "Loc b2",  :address => "tiantan, beijing" )
l3 = Location.create( :name => "Loc b3",  :address => "qianmen, beijing" )
l4 = Location.create( :name => "Loc b4",  :address => "xizhimen, beijing" )
l5 = Location.create( :name => "Loc b5",  :address => "zhongguanchun, beijing" )
l6 = Location.create( :name => "Loc s1",  :address => "puxi, shanghai" )
l7 = Location.create( :name => "Loc s2",  :address => "pudong, shanghai" )
l8 = Location.create( :name => "Loc s3",  :address => "yuyang, shanghai" )
l9 = Location.create( :name => "Loc s4",  :address => "huangpu, shanghai" )

#Companies
print "[testrails2:db:seed]: companies\n"
c1 = Company.create( :name => "Corp 1" )
c1.location = l4
c1.save

c2 = Company.create( :name => "Corp 2" )
c2.location = l3
c2.save

c3 = Company.create( :name => "Corp 3" )
c3.location = l2
c3.save

c4 = Company.create( :name => "Corp 4" )
c4.location = l1
c4.save

#Customers
print "[testrails2:db:seed]: customers\n"
x1 = Customer.create( :name => "cust a", :phone=> "12345678")
x1.company = c1
x1.roles << r1
x1.roles << r2
x1.roles << r3
x1.save

x2 = Customer.create( :name => "cust b", :phone=> "87654321")
x2.company = c2
x2.roles << r5
x2.roles << r6
x2.save

x3 = Customer.create( :name => "cust c", :phone=> "00000000")
x3.company = c3
x3.roles << r1
x3.roles << r4
x3.save

#Orders
print "[testrails2:db:seed]: orders\n"
o1 = Order.create( :details => "order 1", :order_date => Date.new(2012,10,1), :track_no =>  UUIDTools::UUID.timestamp_create.to_s)
o1.customer = x2
o1.save

o2 = Order.create( :details => "order 2", :order_date => Date.new(2012,10,2), :track_no =>  UUIDTools::UUID.timestamp_create.to_s)
o2.customer = x2
o2.save

o3 = Order.create( :details => "order 3", :order_date => Date.new(2012,11,1), :track_no =>  UUIDTools::UUID.timestamp_create.to_s)
o3.customer = x2
o3.save
