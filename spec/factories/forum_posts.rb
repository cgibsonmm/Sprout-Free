# == Schema Information
#
# Table name: forum_posts
#
#  id              :integer          not null, primary key
#  body            :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  forum_thread_id :integer
#  user_id         :integer
#

FactoryBot.define do
  factory :forum_post do
    forum_thread_id { 1 }
    user_id { 1 }
    body { Faker::Lorem.paragraph }
  end
end
