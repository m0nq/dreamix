class AddPasswordDigestToMembers < ActiveRecord::Migration
  def change
    remove_column :members, "password", :string
    add_column :members, :password_digest, :string
  end
end
