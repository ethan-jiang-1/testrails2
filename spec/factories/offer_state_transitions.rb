# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :offer_state_transition do
    offer nil
    event "MyString"
    from "MyString"
    to "MyString"
    created_at "2013-10-23 12:03:32"
  end
end
