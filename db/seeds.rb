# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)


#--Roles
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

#--Locattions
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

#--Pictures
def sd_create_pic name
  relpath = "public/images/seed/" + name.to_s
  data = IO.read Rails.root.join(relpath)
  Picture.create(:content_type => "image/jpg",:store_loc=> "blob",:store_uri => name, :local_data => data)
end

print "[testrails2:db:seed]: pictures\n"
pc1 = sd_create_pic "company-1.jpg"
pc2 = sd_create_pic "company-2.jpg"
pc3 = sd_create_pic "company-3.jpg"
pc4 = sd_create_pic "company-4.jpg"
pd11 = sd_create_pic "product-1-1.jpg"
pd12 = sd_create_pic "product-1-2.jpg"
pd13 = sd_create_pic "product-1-3.jpg"
pd21 = sd_create_pic "product-2-1.jpg"
pd22 = sd_create_pic "product-2-2.jpg"
pd23 = sd_create_pic "product-2-2.jpg"
pe1 = sd_create_pic "employee-1.jpg"
pe2 = sd_create_pic "employee-2.jpg"
pe3 = sd_create_pic "employee-3.jpg"
pe4 = sd_create_pic "employee-4.jpg"
pe5 = sd_create_pic "employee-5.jpg"
pe6 = sd_create_pic "employee-6.jpg"

#-Companies
def sd_create_company name, lx, px
  c = Company.create( :name => name )
  c.location = lx
  c.picture = px
  c.save
  c
end

print "[testrails2:db:seed]: companies\n"
c1 = sd_create_company "HP",    l4, pc1
c2 = sd_create_company "DELL",  l3, pc2
c3 = sd_create_company "IBM",   l2, pc3
c4 = sd_create_company "LENOVO",l1, pc4


#-Products
t1 = Product.create :name => "phone 1", :category => "phone",  :price => 100
t1.pictures << pd11
t1.pictures << pd12
t1.pictures << pd13
t1.save

t2 = Product.create :name => "phone 2", :category => "phone",  :price => 150
t2.pictures << pd21
t2.pictures << pd22
t2.pictures << pd23
t2.save


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



#Employees


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
