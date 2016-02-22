class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :social_media_connected
      t.string :social_profile
      t.integer :number_of_uploads

      t.timestamps null: false
    end
  end
end
