class CreateSiteNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :site_notifications do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
