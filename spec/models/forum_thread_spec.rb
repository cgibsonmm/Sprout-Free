# == Schema Information
#
# Table name: forum_threads
#
#  id               :integer          not null, primary key
#  subject          :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  forum_subject_id :integer
#  user_id          :integer
#

require 'rails_helper'

RSpec.describe ForumThread, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
