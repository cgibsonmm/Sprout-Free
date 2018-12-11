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

require 'rails_helper'

RSpec.describe ForumPost, type: :model do
  it{is_expected.to validate_presence_of(:body)}
  it{is_expected.to validate_length_of(:body).is_at_least(5)}
end
