# == Schema Information
#
# Table name: forum_topics
#
#  id           :integer          not null, primary key
#  position     :integer
#  title :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryBot.define do
  factory :forum_topic do
    title { Faker::Lorem.sentence }
  end
end
