class MembersStreams < ActiveRecord::Migration
  def change
    create_join_table :members, :streams do |t|
      t.references :members
      t.references :streams
      t.index :members_id
      t.index :streams_id
    end
  end
end
