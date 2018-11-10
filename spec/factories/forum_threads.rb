# == Schema Information
#
# Table name: forum_threads
#
#  id             :integer          not null, primary key
#  subject        :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  forum_topic_id :integer
#  user_id        :integer
#

FactoryBot.define do
  factory :forum_thread do
    user_id { 1 }
    forum_topic_id { 1 }
    subject {Faker::Lorem.sentence}
  end
end
