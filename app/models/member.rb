class Member < ActiveRecord::Base
  has_many :songs
  has_many :favorites
  has_many :shares

  validates :password, presence: true, length: { minimum: 8 }
  validates :email, presence: true
end
