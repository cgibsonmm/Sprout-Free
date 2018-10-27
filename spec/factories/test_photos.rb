# == Schema Information
#
# Table name: test_photos
#
#  id         :integer          not null, primary key
#  image_data :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :test_photo do
    image_data { "MyText" }
  end
end
