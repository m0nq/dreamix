class Song < ActiveRecord::Base
  has_one :member, through: :stream
  has_many :favorites
  has_one :member, through: :shares

  validates :title, presence: true
  validates :artist, presence: true
end
