class CreateStreams < ActiveRecord::Migration
  def change
    create_table :streams do |t|
      t.boolean :is_playing, :default => false
      t.timestamps null: false
    end
  end
end
