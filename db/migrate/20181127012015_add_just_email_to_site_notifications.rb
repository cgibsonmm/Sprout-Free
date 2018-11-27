class AddJustEmailToSiteNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :site_notifications, :to_notify, :boolean
  end
end
