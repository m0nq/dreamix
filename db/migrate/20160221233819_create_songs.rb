class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :artist
      t.string :title
      t.string :url
      t.time :duration
      t.string :format
      t.boolean :is_playing

      t.timestamps null: false
    end
  end
end
