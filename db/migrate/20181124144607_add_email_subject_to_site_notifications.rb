class AddEmailSubjectToSiteNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :site_notifications, :email_subject, :string
  end
end
