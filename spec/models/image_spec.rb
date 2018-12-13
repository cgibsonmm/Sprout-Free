# == Schema Information
#
# Table name: images
#
#  id         :bigint(8)        not null, primary key
#  image_data :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Image, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
