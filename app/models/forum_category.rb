# == Schema Information
#
# Table name: forum_categories
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ForumCategory < ApplicationRecord
end
