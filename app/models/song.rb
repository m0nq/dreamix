class Song < ActiveRecord::Base
  belongs_to :member, :through => :stream
  has_many :favorites, :through => :stream
  belongs_to :member, :through => :shares

  validates :title, presence: true
  validates :artist, presence: true
end
