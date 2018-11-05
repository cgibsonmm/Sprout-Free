# == Schema Information
#
# Table name: forum_topics
#
#  id                :integer          not null, primary key
#  position          :integer
#  title             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  forum_category_id :integer
#  user_id           :integer
#

FactoryBot.define do
  factory :forum_topic do
    title { Faker::Lorem.sentence }
  end
end
