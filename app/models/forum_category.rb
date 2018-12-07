# == Schema Information
#
# Table name: forum_categories
#
#  id         :integer          not null, primary key
#  position   :integer
#  slug       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_forum_categories_on_slug     (slug) UNIQUE
#  index_forum_categories_on_user_id  (user_id)
#

class ForumCategory < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  resourcify
  belongs_to :user
  has_many :forum_topics, dependent: :delete_all
  has_many :forum_threads, through: :forum_topics
  has_many :forum_posts, through: :forum_threads

  validates :title, presence: true, length: { minimum: 3 }
end
