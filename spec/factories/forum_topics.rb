# == Schema Information
#
# Table name: forum_topics
#
#  id                :integer          not null, primary key
#  description       :text
#  position          :integer
#  slug              :string
#  title             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  forum_category_id :integer
#  user_id           :integer
#
# Indexes
#
#  index_forum_topics_on_slug  (slug) UNIQUE
#

FactoryBot.define do
  factory :forum_topic do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    user
    forum_category
  end
end
