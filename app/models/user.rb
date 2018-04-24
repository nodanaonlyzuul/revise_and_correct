class User < ApplicationRecord

  validates_presence_of :name
  validates_presence_of :screen_name
  validates_presence_of :email
  # validates_presence_of :twitter_id

end
