class Song < ActiveRecord::Base
  belongs_to :member
  has_many :favorites
  has_many :shares

  validates :title, presence: true
  validates :artist, presence: true
end
