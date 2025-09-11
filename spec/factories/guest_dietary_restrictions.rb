FactoryBot.define do 
  factory :guest_dietary_restriction do 
    association :guest 
    association :dietary_restriction 
  end
end
