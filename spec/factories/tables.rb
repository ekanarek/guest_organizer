FactoryBot.define do 
  factory :table do 
    sequence(:name) { |n| "Table #{n}" }
    seat_capacity { 4 }
    seats_taken { 0 }
    association :user 
  end
end
