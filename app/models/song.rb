class Song < ActiveRecord::Base
  has_one :stream
  has_many :favorites
  has_many :members, through: :favorites

  validates :title, presence: true
  validates :artist, presence: true

  # Void -> ARel
  # returns a randomized queue of all songs for a stream.
  scope :randomized_queue, lambda {
    Song.all.order("RANDOM()")
  }
end
