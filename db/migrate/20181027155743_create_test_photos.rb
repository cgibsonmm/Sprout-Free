class CreateTestPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :test_photos do |t|
      t.text :image_data

      t.timestamps
    end
  end
end
