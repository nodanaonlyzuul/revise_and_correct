class TwitterClient
  attr_reader :rest_client

  def initialize(options = {})
    @rest_client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets[:twitter_consumer_key]
      config.consumer_secret     = Rails.application.secrets[:twitter_consumer_secret]
      config.access_token        = options[:key]
      config.access_token_secret = options[:secret]
    end
  end

end
