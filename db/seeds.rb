# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
category_titles = ['Site Happenings', 'Growing Your Own Cannabis']

# Seed basic categories
category_titles.each do |title|
  ForumCategory.create(user_id: 1, title: title)
end

User.create(username: 'testseed', email: 'test@email.com', password: 'testpass', confirmed_at: Time.now)
User.create(username: 'cgibsonmm', email: 'cgibsonmm@gmail.com', password: 'testpass', confirmed_at: Time.now)
@user = User.find(2)
@user.add_role(:admin)
