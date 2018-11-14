FactoryBot.define do
  factory :user do
    username { Faker::Name.first_name + Faker::Number.between(1, 99).to_s }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password }
    id {  }
    confirmed_at { Time.now }



    factory :admin_user, class: User do
      # username { 'testuser1' }
      # email { 'testemail1@gmail.com' }
      # password { 'password123' }
      # id {  }
      # confirmed_at { Time.now }
      after(:create) { |user| user.add_role(:admin) }
    end
  end
end
