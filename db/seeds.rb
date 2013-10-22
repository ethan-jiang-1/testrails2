# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)


#admin user in 3 different devise DB
print "[testrails2:db:seed]: admins in differnet devise\n"
User.find_or_create_by_email(name:"admin", email:"admin@testrails2.com", password:"123456", password_confirmation:"123456")



#--Roles
print "[testrails2:db:seed]: roles\n"
def sd_create_role name
  r = Role.create(:name=>name)
  if r.nil?
    r.Role.find_by_name(name)
  end
  r
end

r1 = sd_create_role "role 1"
r2 = sd_create_role "role 2"
r3 = sd_create_role "role 3"
r4 = sd_create_role "role 4"
r5 = sd_create_role "role 5"
r6 = sd_create_role "role 6"
r7 = sd_create_role "role 7"
r8 = sd_create_role "role 8"
r9 = sd_create_role "role 9"

#--Locattions
print "[testrails2:db:seed]: locations\n"
def sd_create_location name, address
  l = Location.create( :name => name,  :address => address )
  if l.nil?
    l = Location.find_by_address address
  end
  l
end

l1 = sd_create_location "Loc b1",  "tiananmen, beijing"
l2 = sd_create_location "Loc b2",  "qianmen, beijing"
l3 = sd_create_location "Loc s1",  "puxi, shanghai"
l4 = sd_create_location "Loc s2",  "pudong, shanghai"


#--Pictures
print "[testrails2:db:seed]: pictures\n"
def sd_create_pic name
  relpath = "public/images/seed/" + name.to_s
  abspath = Rails.root.join(relpath)
  data = nil
  begin
    data = IO.read abspath
  rescue
    print "[testrails2:db:seed] Error: when read data from " + abspath   + "\n"
  end
  if data.nil?
    pic = Picture.create(:content_type => "image/jpg",:store_loc=> "blob",:store_uri => name )
  else
    pic = Picture.create(:content_type => "image/jpg",:store_loc=> "blob",:store_uri => name, :local_data => data,  :uuid =>  UUIDTools::UUID.timestamp_create.to_s)
  end
  if pic.nil?
    pic = Picture.find_by_store_uri name
  end
  pic
end

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
pd31 = sd_create_pic "product-3-1.jpg"
pe1 = sd_create_pic "employee-1.jpg"
pe2 = sd_create_pic "employee-2.jpg"
pe3 = sd_create_pic "employee-3.jpg"
pe4 = sd_create_pic "employee-4.jpg"
pe5 = sd_create_pic "employee-5.jpg"
pe6 = sd_create_pic "employee-6.jpg"

#-Companies
print "[testrails2:db:seed]: companies\n"
def sd_create_company name, lx, px
  c = Company.create( :name => name )
  if c.nil?
    c = Company.find_by_name name
  end
  c.location = lx
  c.picture = px
  c.save
  c
end

c1 = sd_create_company "HP",    l4, pc1
c2 = sd_create_company "DELL",  l3, pc2
c3 = sd_create_company "IBM",   l2, pc3
c4 = sd_create_company "LENOVO",l1, pc4


#-Products
def sd_create_product name, category, price
  p = Product.create :name => name, :category => category,  :price => price
  if p.nil?
    p = Product.find_by_name name
  end
  p
end

t1 = sd_create_product "laptop 1", "laptop", 100
t1.pictures << pd11
t1.pictures << pd12
t1.pictures << pd13
t1.save

t2 = sd_create_product "phone 1", "phone", 150
t2.pictures << pd21
t2.pictures << pd22
t2.pictures << pd23
t2.save

t3 = sd_create_product "desktop 1", "desktop", 150
t3.pictures << pd31
t3.save



#Customers
print "[testrails2:db:seed]: customers\n"
def sd_create_customer name, phone
  c = Customer.create :name => name, :phone => phone
  if c.nil?
    c = Customer.find_by_name name
  end
  c
end

x1 = sd_create_customer "cust a", "12345678"
x1.company = c1
x1.roles << r1
x1.roles << r2
x1.roles << r3
x1.save

x2 = sd_create_customer "cust b", "12345678"
x2.company = c2
x2.roles << r5
x2.roles << r6
x2.save

x3 = sd_create_customer "cust c", "12345678"
x3.company = c3
x3.roles << r1
x3.roles << r4
x3.save



#Employees
print "[testrails2:db:seed]: employees\n"
def sd_create_employee name, email, phone
  e = Employee.create :name => name, :email=> email, :phone => phone
  if e.nil?
    e = Employee.find_by_name name
  end
  e
end

e1 = sd_create_employee "lady1", "boos1@hp.com", "12345678"
e1.company = c1
e1.pictures << pe1
e1.manager = e1
e1.save

e2 = sd_create_employee "girl2", "girl2@hp.com", "12345678"
e2.company = c1
e2.pictures << pe2
e2.manager = e1
e2.save

e3 = sd_create_employee "girl3", "girl3@hp.com", "12345678"
e3.company = c1
e3.pictures << pe3
e3.manager = e1
e3.save

e4 = sd_create_employee "boy4", "boy4@hp.com", "12345678"
e4.company = c1
e4.pictures << pe4
e4.manager = e1
e4.save

e5 = sd_create_employee "boy5", "boy5@hp.com", "12345678"
e5.company = c1
e5.pictures << pe5
e5.manager = e1
e5.save

e6= sd_create_employee "boy6", "boy6@hp.com", "12345678"
e6.company = c1
e6.pictures << pe6
e6.manager = e1
e6.save





#Orders
print "[testrails2:db:seed]: orders\n"

def sd_creae_order details, order_date
  o = Order.create( :details => details, :order_date => order_date, :track_no =>  UUIDTools::UUID.timestamp_create.to_s)
  if o.nil?
    o = Order.find_by_details details
  end
  o
end

o1 = sd_creae_order "order 1",  Date.new(2012,10,1)
o1.customer = x3
o1.employee = e1
o1.products << t1

o1.save

o2 = sd_creae_order "order 2",  Date.new(2012,10,2)
o2.customer = x2
o2.employee = e3
o2.products << t2
o2.save

o3 = sd_creae_order "order 3",  Date.new(2012,10,3)
o3.customer = x1
o3.employee = e5
o3.products << t3
o3.save


