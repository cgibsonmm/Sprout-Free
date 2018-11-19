# == Schema Information
#
# Table name: forum_topics
#
#  id                :integer          not null, primary key
#  description       :text
#  position          :integer
#  slug              :string
#  title             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  forum_category_id :integer
#  user_id           :integer
#
# Indexes
#
#  index_forum_topics_on_slug  (slug) UNIQUE
#

class ForumTopic < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  has_many :forum_threads, dependent: :delete_all
  belongs_to :user
  belongs_to :forum_category

  validates :title, presence: true, length: { minimum: 3 }
end
