# == Schema Information
#
# Table name: news_stories
#
#  id           :bigint(8)        not null, primary key
#  body         :string
#  heading      :string
#  published    :boolean
#  published_on :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint(8)
#
# Indexes
#
#  index_news_stories_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

FactoryBot.define do
  factory :news_story do
    heading { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph(4) }

    factory :published_news_story, class: NewsStory do
      published { true }
      published_on { Time.now }
    end
  end
end
