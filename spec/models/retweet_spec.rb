require 'rails_helper'

RSpec.describe Retweet, type: :model do
  it { is_expected.to belong_to(:tweet) }
  it { is_expected.to validate_presence_of(:tweet) }
  it { is_expected.to validate_presence_of(:twitter_id) }
  it { is_expected.to validate_uniqueness_of(:twitter_id).scoped_to(:tweet_id) }
end
