FactoryBot.define do
  factory :user do
    username { 'testuser' }
    email { 'testemail@gmail.com' }
    password { 'password123' }
    id { 1 }
    confirmed_at { Time.now }
  end
end
