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

  after_create :notifiy_users

  def notifiy_users
    mentioned_users.each do |user|
      puts '!!!!!!!!HELLO'
      puts ''
      puts ''
      puts ''
      notification = Notification.create(recipient: user, actor: self.user, action: 'mentioned', notifiable: self)
      notification.save
      puts '________________'
    end
  end

  def mentions
    @mentions ||= begin
                    regex = /@([\w]+)/
                    matches = body.scan(regex).flatten
                  end
  end

  def mentioned_users
    @mentioned_users ||= User.where(username: mentions)
  end
end
