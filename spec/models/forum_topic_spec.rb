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

require 'rails_helper'

RSpec.describe ForumTopic, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
