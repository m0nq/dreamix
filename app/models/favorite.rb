class Favorite < ActiveRecord::Base
  belongs_to :members
  belongs_to :songs
end
