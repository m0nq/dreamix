class CreateFavorites < ActiveRecord::Migration
  def up
    create_table :favorites do |t|
      t.belongs_to :songs, index: true
      t.belongs_to :members, index: true
      t.datetime :time
      t.timestamps null: false
    end
    # add_index(:favorites, :members_id)
    # add_index(:favorites, :songs_id)
  end

  def down
    drop_table :favorites
  end
end
