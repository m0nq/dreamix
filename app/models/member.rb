class Member < ActiveRecord::Base
  has_many :songs, :through => :stream
  has_many :favorites
  has_many :shares

  validates :password, presence: true, length: { minimum: 8 }
  validates :email, presence: true, :format { with: /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b/i, message: "Please enter a valid email" }
end
