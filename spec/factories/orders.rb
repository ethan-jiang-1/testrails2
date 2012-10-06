# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    sequence(:product) {|n| "prd#{n}" }
    order_date Date::today
  end
end
