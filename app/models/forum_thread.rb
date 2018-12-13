# == Schema Information
#
# Table name: forum_threads
#
#  id                   :bigint(8)        not null, primary key
#  last_forum_post_time :datetime
#  subject              :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  forum_topic_id       :integer
#  user_id              :integer
#

class ForumThread < ApplicationRecord
  belongs_to :user
  belongs_to :forum_topic
  has_many :forum_posts, dependent: :destroy
  has_many :users,       through: :forum_posts
  has_many :follows,     dependent: :destroy
  has_many :notifications, as: :notifiable, dependent: :delete_all

  accepts_nested_attributes_for :forum_posts

  validates :subject, presence: true, length: { minimum: 3 }
  validates_associated :forum_posts
end
