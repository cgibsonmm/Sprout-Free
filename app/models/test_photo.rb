# == Schema Information
#
# Table name: test_photos
#
#  id         :integer          not null, primary key
#  image_data :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TestPhoto < ApplicationRecord
  include ImageUploader[:image]
end
