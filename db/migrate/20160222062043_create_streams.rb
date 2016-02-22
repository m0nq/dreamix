class CreateStreams < ActiveRecord::Migration
  def change
    create_table :streams do |t|
      t.references :song # queue of songs
      t.references :member # list of members
      t.boolean :is_playing
      t.timestamps null: false
    end
  end
end
