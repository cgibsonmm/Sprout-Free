# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  # 200.times do |user|
  #   user = User.create( email: Faker::Internet.safe_email, username: Faker::Internet.username, password: Faker::Internet.password(10))
  # end

  10.times do |category|
    @category = ForumCategory.create(user_id: 1, title: Faker::Lorem.sentence)
    (3..10).to_a.sample.times do
      @topic = ForumTopic.create(user_id: 1, forum_category_id: @category.id, title: Faker::Lorem.sentence, description: Faker::Lorem.sentence )
    end
  end
