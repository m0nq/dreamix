class CreateStreams < ActiveRecord::Migration
  def change
    create_table :streams do |t|
      t.references :song # queue of songs
      t.references :member # member associated with session
      t.boolean :is_playing
      t.timestamps null: false
    end
    add_index(:streams, :member_id)
    add_index(:streams, :song_id)
  end
end
