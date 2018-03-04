#!/usr/bin/env ruby
require File.expand_path('../../config/environment',  __FILE__)
require 'twitter_client'

@logger = Logger.new(File.join(Rails.root, 'log', 'poll_for_new_tweets.log'), File::WRONLY | File::APPEND |  File::CREAT)
@twitter_client = TwitterClient.new.rest_client

TwitterAccount.find_each do |twitter_account|
   @logger.info("Looking for Tweets for '#{twitter_account.screen_name}'")

   options = {
     trim_user: true,
     count: 2
   }

   # TODO: Look into include_rts
   last_tweet = twitter_account.tweets.order('tweeted_at DESC').first

   if last_tweet
     options.merge!(since_id: last_tweet.twitter_id)
   end

   recent_tweets = @twitter_client.user_timeline(twitter_account.screen_name, options)

   all_tweets_by_this_account = twitter_account.tweets.pluck(:twitter_id)

   recent_tweets.each do |recent_tweet|
     if all_tweets_by_this_account.include?(recent_tweet.id.to_s)
       @logger.info "skipping tweet #{recent_tweet.id}, it's already saved"
     else
       @logger.info "saving new tweet #{recent_tweet.id} for user #{twitter_account.screen_name}"
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
