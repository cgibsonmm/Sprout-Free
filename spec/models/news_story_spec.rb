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

require 'rails_helper'

RSpec.describe NewsStory, type: :model do
  
  it{is_expected.to validate_presence_of(:heading)}
  it{is_expected.to validate_presence_of(:body)}
  it{is_expected.to validate_length_of(:body).is_at_least(15)}
end
