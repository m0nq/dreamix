class Stream < ActiveRecord::Base
  has_many :songs
  has_many :members
end