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

FactoryBot.define do
  factory :forum_category do
    title { Faker::Cannabis.medical_use }
    user
  end
end
