FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "ruby#{n}@garage.com" }
    password { "password"} 
    password_confirmation { "password" }
    end
end