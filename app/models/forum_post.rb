# == Schema Information
#
# Table name: forum_posts
#
#  id              :bigint(8)        not null, primary key
#  body            :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  forum_thread_id :integer
#  user_id         :integer
#

class ForumPost < ApplicationRecord
  belongs_to :user
  belongs_to :forum_thread
  has_many   :likes, dependent: :delete_all
  has_many   :notifications, as: :notifiable, dependent: :delete_all

  validates :body, presence: true, length: { minimum: 5 }
end
