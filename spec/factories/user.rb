FactoryBot.define do
  factory :user do
    username { 'testuser' }
    email { 'testemail@gmail.com' }
    password { 'password123' }
    id { 1 }
    confirmed_at { Time.now }



    factory :admin_user, class: User do
      after(:create) { |user| user.add_role(:admin) }
    end
  end
end
