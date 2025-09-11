FactoryBot.define do 
  factory :dietary_restriction do 
    sequence(:name) { |n| "Restriction #{n}" }
    description { "Some description" }
    association :user 
  end
end
