class Share < ActiveRecord::Base
  belongs_to :member
  belongs_to :song
end
