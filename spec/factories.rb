# This will guess the User class
FactoryGirl.define do
  factory :user do
    email "f@f.com"
    password  "12345678"
    password_confirmation  "12345678"
  end
end

