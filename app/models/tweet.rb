class Tweet < ApplicationRecord
  belongs_to :twitter_account
  validates_presence_of :twitter_account
  validates_presence_of :twitter_id
  validates_presence_of :text
  validates_uniqueness_of :twitter_id, scope: :twitter_account_id
end
