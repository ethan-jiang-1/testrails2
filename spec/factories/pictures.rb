# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :picture  do
    sequence(:uuid) {|n| UUIDTools::UUID.random_create.to_s }
  end
end
