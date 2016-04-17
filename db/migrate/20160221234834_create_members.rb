class CreateMembers < ActiveRecord::Migration
  def up
    create_table :members do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :social_media_connected
      t.string :social_profile
      t.integer :number_of_uploads
      t.integer :soundcloud_user_id
      t.string :soundcloud_access_token
      t.references :streams
      t.referecess :songs, index: true
      t.timestamps null: false
    end
    add_index :members, :name
    add_index :members, :email
    add_index :members, :soundcloud_user_id
    add_index :members, :social_profile
    add_index :members, :streams_id
  end

  def down
    drop_table :members
  end
end
