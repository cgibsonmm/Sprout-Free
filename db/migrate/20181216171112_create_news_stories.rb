class CreateNewsStories < ActiveRecord::Migration[5.2]
  def change
    create_table :news_stories do |t|
      t.references :user, foreign_key: true
      t.string :heading
      t.string :body
      t.boolean :published
      t.datetime :published_on

      t.timestamps
    end
  end
end
