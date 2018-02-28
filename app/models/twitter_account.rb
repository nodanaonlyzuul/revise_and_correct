class TwitterAccount < ApplicationRecord
  validates_presence_of :screen_name
end
