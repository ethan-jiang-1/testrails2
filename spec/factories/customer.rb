# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer do
    sequence(:name) {|n| "cus#{n}" }
    sequence(:phone) {|n| "800-#{n}" }
  end
end
