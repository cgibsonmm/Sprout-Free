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

class Tickler < ApplicationRecord

  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false, message: 'all ready reciving updates' }

  def send_notifications
    our_emails = %w[cgibsonmmdev@gmail.com ]
    TicklerMailer.tickler_email(email).deliver_now
    our_emails.each { |our_email| TicklerMailer.admin_mailer(our_email, email).deliver_now }
  end
end
