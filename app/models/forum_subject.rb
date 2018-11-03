# == Schema Information
#
# Table name: forum_subjects
#
#  id           :integer          not null, primary key
#  position     :integer
#  subject_name :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ForumSubject < ApplicationRecord
  has_many :forum_threads, dependent: :delete_all

  validates :subject_name, presence: true, length: { minimum: 3 }
end
