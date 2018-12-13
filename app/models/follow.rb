# == Schema Information
#
# Table name: follows
#
#  id              :bigint(8)        not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  forum_thread_id :bigint(8)
#  user_id         :bigint(8)
#
# Indexes
#
#  index_follows_on_forum_thread_id  (forum_thread_id)
#  index_follows_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (forum_thread_id => forum_threads.id)
#  fk_rails_...  (user_id => users.id)
#

class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :forum_thread
end
