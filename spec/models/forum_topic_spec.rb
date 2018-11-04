# == Schema Information
#
# Table name: forum_topics
#
#  id         :integer          not null, primary key
#  position   :integer
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe ForumTopic, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
