FactoryBot.define do
  factory :friendship do
    status {Faker::Number.between(from: 0, to: 2) } 
    user_id { create(:user).id}   
    friend_id { create(:user).id}   
  end
end
