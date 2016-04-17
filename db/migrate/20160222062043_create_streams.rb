class CreateStreams < ActiveRecord::Migration
  def up
    create_table :streams do |t|
      t.references :songs # queue of songs
      t.references :members # member associated with session
      t.boolean :is_playing, :default => false
      t.timestamps null: false
    end
    add_index(:streams, :members_id)
    add_index(:streams, :songs_id)
  end

  def down
    drop_table :streams
  end
end
