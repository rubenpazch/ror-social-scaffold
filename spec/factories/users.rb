FactoryBot.define do
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
  end
