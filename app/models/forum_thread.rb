# == Schema Information
#
# Table name: forum_threads
#
#  id             :integer          not null, primary key
#  subject        :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  forum_topic_id :integer
#  user_id        :integer
#

class ForumThread < ApplicationRecord
  belongs_to :user
  belongs_to :forum_topic
  has_many :forum_posts, dependent: :destroy

  accepts_nested_attributes_for :forum_posts

  validates :subject, presence: true, length: { minimum: 3 }
  validates_associated :forum_posts
end
