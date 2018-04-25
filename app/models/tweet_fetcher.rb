require 'twitter_client'

class TweetFetcher
  def initialize(user)
    @twitter_client = TwitterClient.new(key: user.key, secret: user.secret).rest_client
  end

  def fetch!
    TwitterAccount.find_each do |twitter_account|
      options = {trim_user: true, count: 100}

      last_tweet = twitter_account.tweets.order('tweeted_at DESC').first

      options[:since_id] = last_tweet.twitter_id if last_tweet

      recent_tweets = @twitter_client.user_timeline(twitter_account.screen_name, options)

      all_tweets_by_this_account = twitter_account.tweets.pluck(:twitter_id)

      recent_tweets.each do |recent_tweet|
        if all_tweets_by_this_account.include?(recent_tweet.id.to_s)
        else
          tweet = Tweet.create(
            twitter_account: twitter_account,
            twitter_id: recent_tweet.id.to_s,
            text: recent_tweet.full_text,
            original_response: recent_tweet.to_json,
            tweeted_at: recent_tweet.created_at
          )
        end
      end
    end
  end
end
