class CreateFavorites < ActiveRecord::Migration
  def up
    create_table :favorites do |t|
      t.references :song
      t.references :member
      t.datetime :time
      t.timestamps null: false
    end
    add_index(:favorites, :member_id)
    add_index(:favorites, :song_id)
  end

  def down
    drop_table :favorites
  end
end
