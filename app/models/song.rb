class Song < ActiveRecord::Base
  belongs_to :stream
  has_many :favorites
  belongs_to :member

  validates :title, presence: true
  validates :artist, presence: true
end
