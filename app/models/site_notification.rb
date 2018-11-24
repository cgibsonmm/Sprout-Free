# == Schema Information
#
# Table name: site_notifications
#
#  id            :integer          not null, primary key
#  body          :text
#  email_me      :boolean
#  email_subject :string
#  title         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#
# Indexes
#
#  index_site_notifications_on_user_id  (user_id)
#

class SiteNotification < ApplicationRecord
  belongs_to :user
end
