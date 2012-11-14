# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    sequence(:details) {|n| "details#{n}" }
    order_date Date::today
  end
end
