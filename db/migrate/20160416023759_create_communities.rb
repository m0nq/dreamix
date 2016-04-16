class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.references :members
      t.references :streams
      t.timestamps null: false
    end
    # TODO: figure out how to add an index to table join reference
    add_index(:communities, [:members_id, :streams_id])
  end
end
