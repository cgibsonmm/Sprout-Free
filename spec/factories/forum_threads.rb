# == Schema Information
#
# Table name: forum_threads
#
#  id                   :bigint(8)        not null, primary key
#  last_forum_post_time :datetime
#  subject              :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  forum_topic_id       :integer
#  user_id              :integer
#

FactoryBot.define do
  factory :forum_thread do
    user
    forum_topic
    subject {Faker::Lorem.sentence}
  end
end
