# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :booking_state_transition do
    booking nil
    event "MyString"
    from "MyString"
    to "MyString"
    created_at "2013-08-15 01:24:04"
  end
end
