# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :offer do
    name "MyString"
    price_per_night ""
    price_from_mmc ""
    price_from_opr ""
    comment "MyString"
  end
end
