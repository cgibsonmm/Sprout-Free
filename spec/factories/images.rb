# == Schema Information
#
# Table name: images
#
#  id         :bigint(8)        not null, primary key
#  image_data :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :image do
    image_data { 'MyText' }
  end
end
