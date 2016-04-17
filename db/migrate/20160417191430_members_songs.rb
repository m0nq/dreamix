class MembersSongs < ActiveRecord::Migration
  def change
    create_join_table :members, :songs do |t|
      t.references :members
      t.references :songs
      t.index :members_id
      t.index :songs_id
    end
  end
end
