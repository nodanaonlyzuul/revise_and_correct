#!/usr/bin/env ruby
require File.expand_path('../../config/environment',  __FILE__)
require 'twitter_client'

@logger = Logger.new(File.join(Rails.root, 'log', 'poll_for_retweets.log'), File::WRONLY | File::APPEND |  File::CREAT)

@logger.info "Searching for retweets of eligable tweets"

Reply.recently_replied.includes(:tweet).each do |reply|
  @twitter_client = TwitterClient.new.rest_client
  tweet = reply.tweet
  @logger.info "Checking Tweet id: #{tweet.id}"

  already_saved_retweets = tweet.retweets.pluck(:twitter_id)
  retweets = @twitter_client.retweets(tweet.twitter_id, count: 100)

  retweets.each do |retweet|
    if already_saved_retweets.include?(retweet.id.to_s)
      @logger.info("Skipping retweet #{retweet.id.to_s}, already saved.")
    else
      new_retweet = Retweet.new(
        tweet: tweet,
        twitter_id: retweet.id.to_s,
        original_response: tweet.to_json
      )
      if new_retweet.save
        @logger.info("Saved retweet #{new_retweet.id.to_s} of tweet #{tweet.id} (#{tweet.twitter_id}).")
      else
        @logger.error("Couldn't save retweet: #{new_retweet.errors.full_messages.join(',')}")
      end
    end
  end

end
