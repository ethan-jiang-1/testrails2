# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :employee do
    sequence(:name) {|n| "emp#{n}" }
  end
end
