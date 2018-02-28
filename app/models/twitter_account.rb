class TwitterAccount < ApplicationRecord
  validates_presence_of :screen_name
  validates_presence_of :twitter_id
end
