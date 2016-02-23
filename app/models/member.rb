class Member < ActiveRecord::Base

  has_secure_password

  has_many :songs, :through => :stream
  has_many :favorites
  has_many :shares

  validates :password, presence: true, length: { minimum: 8 }
  validates :email, presence: true, format: { with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/, message: "Please enter a valid email" }
end
