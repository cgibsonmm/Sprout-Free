class AddEmailMeToSiteNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :site_notifications, :email_me, :boolean
  end
end
