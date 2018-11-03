# == Schema Information
#
# Table name: forum_categories
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_forum_categories_on_user_id  (user_id)
#

require 'rails_helper'

RSpec.describe ForumCategory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
