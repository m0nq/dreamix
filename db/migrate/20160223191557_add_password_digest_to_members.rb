class AddPasswordDigestToMembers < ActiveRecord::Migration
  def up
    # rename_column :members, "password", :password_digest
    remove_column :members, "password", :string
    add_column :members, :password_digest, :string
  end

  def down
    remove_column :members, :password_digest, :string
    add_column :members, "password", :string
  end
end
