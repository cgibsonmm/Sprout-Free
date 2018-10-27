# == Schema Information
#
# Table name: test_photos
#
#  id         :integer          not null, primary key
#  image_data :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe TestPhoto, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
