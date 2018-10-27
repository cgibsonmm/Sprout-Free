# == Schema Information
#
# Table name: forum_post_photos
#
#  id         :integer          not null, primary key
#  image_data :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_forum_post_photos_on_user_id  (user_id)
#

class ForumPostPhoto < ApplicationRecord
  include ImageUploader[:image]
  belongs_to :user
end
