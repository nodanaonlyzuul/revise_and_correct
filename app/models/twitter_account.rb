class TwitterAccount < ApplicationRecord
  has_many :tweets, dependent: :destroy
  validates_presence_of :screen_name
  validates_uniqueness_of :screen_name
  validates_presence_of :twitter_id
end
