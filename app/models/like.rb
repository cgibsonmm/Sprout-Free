# == Schema Information
#
# Table name: likes
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  forum_post_id :integer
#  user_id       :integer
#
# Indexes
#
#  index_likes_on_forum_post_id  (forum_post_id)
#  index_likes_on_user_id        (user_id)
#

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :forum_post
end
