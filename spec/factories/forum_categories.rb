# == Schema Information
#
# Table name: forum_categories
#
#  id         :integer          not null, primary key
#  position   :integer
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_forum_categories_on_user_id  (user_id)
#

FactoryBot.define do
  factory :forum_category do
    title { Faker::Cannabis.medical_use }
    user
  end
end
