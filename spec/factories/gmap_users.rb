# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gmap_user do
    name "MyString"
    address "MyString"
    latitude 1.5
    longitude 1.5
    gmaps false
  end
end
