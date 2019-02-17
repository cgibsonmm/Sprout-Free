# == Schema Information
#
# Table name: forum_posts
#
#  id              :bigint(8)        not null, primary key
#  body            :text
#  likes_count     :integer
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

  validates :body, presence: true, length: { minimum: 16, message: 'minimum 5 chars' }

  # Activity feed
  include PublicActivity::Common

  # def notifiy_users
  #   puts mentioned_users
  #   mentioned_users.each do |user|
  #     notification = Notification.create(recipient: user, actor: self.user, action: 'mentioned', notifiable: self)
  #     notification.save
  #   end
  # end

  def mentions
    @mentions ||= begin
                    regex = /@([\w]+)/
                    matches = body.scan(regex).flatten
                  end
  end

  def mentioned_users
    @mentioned_users ||= User.where(username: mentions)
  end

  def total_likes
    self.likes.size
  end
end
