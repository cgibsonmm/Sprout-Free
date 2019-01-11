class ChangeDefaultInSiteNotifications < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:site_notifications, :email_me, false)
    change_column_default(:site_notifications, :to_notify, false)
  end
end
