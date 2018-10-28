# == Schema Information
#
# Table name: forum_posts
#
#  id              :integer          not null, primary key
#  body            :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  forum_thread_id :integer
#  user_id         :integer
#

class ForumPost < ApplicationRecord
  belongs_to :user
  has_many_attached :files
  belongs_to :forum_thread, optional: true

  validates :body, presence: true, length: { minimum: 10 }
end
