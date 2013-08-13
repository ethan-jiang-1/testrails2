# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :currency_number do
    float1 1.5
    float2 1.5
    decimal1 "9.99"
    decimal2 "9.99"
    integer1 1
    integer2 1
  end
end
