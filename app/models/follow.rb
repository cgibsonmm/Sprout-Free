# == Schema Information
#
# Table name: follows
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  forum_thread_id :integer
#  user_id         :integer
#
# Indexes
#
#  index_follows_on_forum_thread_id  (forum_thread_id)
#  index_follows_on_user_id          (user_id)
#

class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :forum_thread
end
