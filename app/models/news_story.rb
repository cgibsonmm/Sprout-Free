# == Schema Information
#
# Table name: news_stories
#
#  id           :bigint(8)        not null, primary key
#  body         :string
#  heading      :string
#  published    :boolean
#  published_on :time
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

class NewsStory < ApplicationRecord
  belongs_to :user

  validates :heading, presence: true
  validates :body,    presence: true, length: {minimum: 15}

end
