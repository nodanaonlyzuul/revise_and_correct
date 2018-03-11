class Tweet < ApplicationRecord
  belongs_to :twitter_account
  has_many :retweets, dependent: :destroy
  has_one  :reply, dependent: :destroy
  validates_presence_of :twitter_account
  validates_presence_of :twitter_id
  validates_presence_of :text
  validates_presence_of :original_response
  validates_uniqueness_of :twitter_id, scope: :twitter_account_id
end
