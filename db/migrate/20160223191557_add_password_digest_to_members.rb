class AddPasswordDigestToMembers < ActiveRecord::Migration
  def change
    # rename_column :members, "password", :password_digest
    remove_column :members, "password", :string
    add_column :members, :password_digest, :string
  end
end
