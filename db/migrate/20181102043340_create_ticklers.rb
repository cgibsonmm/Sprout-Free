class CreateTicklers < ActiveRecord::Migration[5.2]
  def change
    create_table :ticklers do |t|
      t.string :email

      t.timestamps
    end
    add_index :ticklers, :email, unique: true
  end
end
