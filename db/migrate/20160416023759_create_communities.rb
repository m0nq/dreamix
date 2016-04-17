class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.references :members
      t.references :streams
      t.timestamps null: false
    end
    add_index(:communities, [:members_id, :streams_id])
  end
end
