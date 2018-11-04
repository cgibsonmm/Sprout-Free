# == Schema Information
#
# Table name: forum_topics
#
#  id         :integer          not null, primary key
#  position   :integer
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ForumTopic < ApplicationRecord
  has_many :forum_threads, dependent: :delete_all

  validates :title, presence: true, length: { minimum: 3 }
end