# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :assembly do
    sequence(:name) {|n| "assembly#{n}" }
  end
end
