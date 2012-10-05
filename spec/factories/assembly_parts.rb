# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :assembly_part do
    assembly nil
    part nil
  end
end
