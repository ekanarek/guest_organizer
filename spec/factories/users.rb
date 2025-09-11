FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    password { "password123" }
  end
end
