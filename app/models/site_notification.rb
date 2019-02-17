# == Schema Information
#
# Table name: site_notifications
#
#  id            :bigint(8)        not null, primary key
#  body          :text
#  email_me      :boolean
#  email_subject :string
#  title         :string
#  to_notify     :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint(8)
#
# Indexes
#
#  index_site_notifications_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class SiteNotification < ApplicationRecord
  belongs_to :user
end
