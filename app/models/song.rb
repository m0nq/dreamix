class Song < ActiveRecord::Base
  has_many :streams
  has_many :favorites
  has_one :member #, through: :stream

  validates :title, presence: true
  validates :artist, presence: true

  # Void -> ARel
  # returns a randomized queuse of all songs for a stream.
  scope :randomized_queue, lambda {
    Song.all.order("RANDOM()")
  }
end
