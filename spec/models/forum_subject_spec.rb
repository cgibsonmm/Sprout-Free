# == Schema Information
#
# Table name: forum_subjects
#
#  id           :integer          not null, primary key
#  subject_name :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe ForumSubject, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
