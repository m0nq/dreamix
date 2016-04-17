class Song < ActiveRecord::Base
  has_one :stream
  has_and_belongs_to_many :members

  validates :title, presence: true
  validates :artist, presence: true

  # Void -> ARel
  # returns a randomized queue of all songs for a stream.
  scope :randomized_queue, lambda {
    Song.all.order("RANDOM()")
  }
end
