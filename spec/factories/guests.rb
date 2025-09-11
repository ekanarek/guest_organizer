FactoryBot.define do 
  factory :guest do 
    sequence(:name) { |n| "Guest #{n}" }
    age { rand(18..70) }
    association :user

    trait :with_table do 
      association :table 
    end
  end
end
