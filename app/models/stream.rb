class Stream < ActiveRecord::Base
  has_many :songs
  belongs_to :member
end
