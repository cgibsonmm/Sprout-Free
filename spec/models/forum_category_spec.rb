# == Schema Information
#
# Table name: forum_categories
#
#  id         :bigint(8)        not null, primary key
#  position   :integer
#  slug       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#
# Indexes
#
#  index_forum_categories_on_slug     (slug) UNIQUE
#  index_forum_categories_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe ForumCategory, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_length_of(:title).is_at_least(3) }
end
