# == Schema Information
#
# Table name: likes
#
#  id            :bigint(8)        not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  forum_post_id :bigint(8)
#  user_id       :bigint(8)
#
# Indexes
#
#  index_likes_on_forum_post_id  (forum_post_id)
#  index_likes_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (forum_post_id => forum_posts.id)
#  fk_rails_...  (user_id => users.id)
#

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :forum_post, counter_cache: true

  include PublicActivity::Common
end
