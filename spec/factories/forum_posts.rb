# == Schema Information
#
# Table name: forum_posts
#
#  id              :bigint(8)        not null, primary key
#  body            :text
#  likes_count     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  forum_thread_id :integer
#  user_id         :integer
#

FactoryBot.define do
  factory :forum_post do
    user
    body { Faker::Lorem.paragraph }

    factory :forum_post_in_thread do
      forum_thread
      body { Faker::Lorem.paragraph }
    end
  end
end
