class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.references :song
      t.references :member
      t.datetime :time
      t.timestamps null: false
    end
    add_index :shares, [:member_id, :song_id]
  end
end
