FactoryBot.define do
  factory :task do
    sequence(:name) { |n| "Task name #{n}" }
    done { false }
    project { nil }
    position { rand(0..10) }
  end
end