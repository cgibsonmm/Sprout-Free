# == Schema Information
#
# Table name: forum_topics
#
#  id                :integer          not null, primary key
#  description       :text
#  position          :integer
#  title             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  forum_category_id :integer
#  user_id           :integer
#

class ForumTopic < ApplicationRecord
  has_many :forum_threads, dependent: :delete_all
  belongs_to :user
  belongs_to :forum_category

  validates :title, presence: true, length: { minimum: 3 }
end
