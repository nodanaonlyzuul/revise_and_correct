module ApplicationHelper
  def url_of_tweet(tweet)
    "https://twitter.com/#{tweet.twitter_account.screen_name}/status/#{tweet.twitter_id}"
  end
end
