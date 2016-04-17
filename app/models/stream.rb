class Stream < ActiveRecord::Base
  has_many :songs
  has_and_belongs_to_many :members
end
