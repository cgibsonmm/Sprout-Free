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

FactoryBot.define do
  factory :forum_subject do
    subject_name { 'This is a subject' }
  end
end
