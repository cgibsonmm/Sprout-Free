# == Schema Information
#
# Table name: forum_threads
#
#  id               :integer          not null, primary key
#  photo_file       :text
#  subject          :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  forum_subject_id :integer
#  user_id          :integer
#

class ForumThread < ApplicationRecord
  belongs_to :user
  belongs_to :forum_subject
  has_many :forum_posts, dependent: :destroy

  accepts_nested_attributes_for :forum_posts

  validates :subject, presence: true, length: { in: 3..50 }
  validates_associated :forum_posts
end
