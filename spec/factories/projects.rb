FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "Thing to do #{n}" }
    user 
  
  end
end