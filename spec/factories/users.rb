FactoryBot.define do
<<<<<<< HEAD
    factory :user do
      name { 'Raul' }
      email { 'raul@gmail.com' }
      password { 'password' }
      password_confirmation { 'password' }
    end

    factory :friend, class: 'User' do
      name { 'Perez' }
      email { 'perez@gmail.com' }
      password { 'password' }
      password_confirmation { 'password' }
    end

    factory :friendtwo, class: 'User' do
      name { 'David' }
      email { 'david@gmail.com' }
      password { 'password' }
      password_confirmation { 'password' }
    end

    factory :friendship do
      user_id { create(:user).id }
      friend_id { create(:user).id }
      status { 0 }
    end
=======
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
>>>>>>> e697a4e4a53d2fd02d90fc22b01afc99b428f7ce
  end
end
