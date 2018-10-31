FactoryBot.define do
  factory :user do
    username { 'testuser' }
    email { 'testemail@email.com' }
    password { 'password123' }
    id { 1 }
  end
end
