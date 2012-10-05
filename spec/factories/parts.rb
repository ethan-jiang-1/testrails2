# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :part do
    sequence(:part_name) {|n| "part#{n}" }
  end
end
