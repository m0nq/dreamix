class CreateSongs < ActiveRecord::Migration
  def up
    create_table :songs do |t|
      t.string :artist
      t.string :title
      t.string :url
      t.time :duration
      t.string :format
      t.boolean :is_playing
      t.references :member
      t.references :stream
      t.timestamps null: false
    end
    add_index(:songs, :member_id)
    add_index(:songs, :artist)
    add_index(:songs, :title)
    add_index(:songs, :url)
  end

  def down
    drop_table :songs
  end
end
