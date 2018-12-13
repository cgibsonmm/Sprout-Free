# == Schema Information
#
# Table name: ticklers
#
#  id         :bigint(8)        not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_ticklers_on_email  (email) UNIQUE
#

FactoryBot.define do
  factory :tickler do
    email { "email@email.com" }
  end
end
