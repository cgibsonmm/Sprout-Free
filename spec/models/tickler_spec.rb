# == Schema Information
#
# Table name: ticklers
#
#  id         :integer          not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_ticklers_on_email  (email) UNIQUE
#

require 'rails_helper'

RSpec.describe Tickler, type: :model do
  it { should validate_presence_of :email}
end
