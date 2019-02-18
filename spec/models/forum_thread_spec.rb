# == Schema Information
#
# Table name: forum_threads
#
#  id                   :bigint(8)        not null, primary key
#  editted              :boolean          default(FALSE)
#  last_forum_post_time :datetime
#  post_count           :integer          default(1)
#  subject              :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  forum_topic_id       :integer
#  user_id              :integer
#

require 'rails_helper'

RSpec.describe ForumThread, type: :model do
  it{is_expected.to validate_presence_of(:subject)}
  it{is_expected.to validate_length_of(:subject).is_at_least(3)}
end
