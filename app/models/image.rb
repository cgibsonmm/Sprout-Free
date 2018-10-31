# == Schema Information
#
# Table name: images
#
#  id         :integer          not null, primary key
#  image_data :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Image < ApplicationRecord
  include ::PhotoUploader::Attachment.new(:image)
end