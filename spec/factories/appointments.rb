# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :appointment do
    appointment_date   DateTime.now
    #sequence(:appointment_date) {|n| DateTime.now + 1 }
  end
end
