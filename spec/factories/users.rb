FactoryBot.define do
    factory :user do
      name { 'Raul' }
      email { 'raul@gmail.com' }
      password { 'password' }
      password_confirmation { 'password' }
    end
  end