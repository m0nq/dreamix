class CreateFavorites < ActiveRecord::Migration
  def up
    create_table :favorites do |t|
      t.references :songs
      t.references :members
      t.datetime :time
      t.timestamps null: false
    end
    add_index(:favorites, [:members_id, :songs_id])
  end

  def down
    drop_table :favorites
  end
end
