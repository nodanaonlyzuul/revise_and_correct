class Retweet < ApplicationRecord
  belongs_to :tweet, counter_cache: true
  validates_presence_of :tweet
  validates_presence_of :twitter_id
  validates_presence_of :original_response
  validates_uniqueness_of :twitter_id, scope: :tweet_id
end
