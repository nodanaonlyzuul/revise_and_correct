#!/usr/bin/env ruby
require File.expand_path('../../config/environment',  __FILE__)
require 'twitter_client'

@logger = Logger.new(File.join(Rails.root, 'log', 'poll_for_retweets.log'), File::WRONLY | File::APPEND |  File::CREAT)
@twitter_client = TwitterClient.new.rest_client

recent_tweet_count = Tweet.where("tweeted_at >= ", 48.hours.ago).count
@logger.info("there have been #{recent_tweet_count} tweets in made in the last 48 hours")
