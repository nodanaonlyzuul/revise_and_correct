require 'rails_helper'

RSpec.describe Tweet, type: :model do
  it { is_expected.to belong_to(:twitter_account) }
  it { is_expected.to have_many(:retweets) }
  it { is_expected.to have_one(:reply) }
  it { is_expected.to validate_presence_of(:twitter_account) }
  it { is_expected.to validate_presence_of(:twitter_id)      }
  it { is_expected.to validate_presence_of(:text)            }
  it { is_expected.to validate_uniqueness_of(:twitter_id).scoped_to(:twitter_account_id) }
end
