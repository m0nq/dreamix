class Member < ActiveRecord::Base

  has_secure_password

  has_and_belongs_to_many :streams
  has_and_belongs_to_many :songs

  validates :password, presence: true, length: { minimum: 8 }
  validates :email, presence: true, format: { with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/, message: "Please enter a valid email" }

  def self.create_from_soundcloud(access_token)
    create! do |user|
      user.soundcloud_user_id = soundcloud_user["id"]
      user.soundcloud_access_token = access_token["access_token"]
    end
  end
end
