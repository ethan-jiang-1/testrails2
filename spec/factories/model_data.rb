# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :model_datum do
    boolean1 false
    boolean2 false
    date1 "2013-07-27"
    date2 "2013-07-27"
    datetime1 "2013-07-27 17:40:50"
    datetime2 "2013-07-27 17:40:50"
    decimal1 "9.99"
    decimal2 "9.99"
    float1 1.5
    float2 1.5
    integer1 1
    integer2 1
    string1 "MyString"
    string2 "MyString"
    time1 "2013-07-27 17:40:50"
    time2 "2013-07-27 17:40:50"
    timestamp1 "2013-07-27 17:40:50"
    timestamp2 "2013-07-27 17:40:50"
    text1 "MyText"
    text2 "MyText"
  end
end
