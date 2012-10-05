# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :patient do
    sequence(:name) {|n| "Pt. Tom#{n}" }
  end
end
