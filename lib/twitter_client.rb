class TwitterClient
  attr_reader :rest_client
  
  # TODO: Pass in user-specific credentials
  def initialize
    @rest_client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets[:twitter_consumer_key]
      config.consumer_secret     = Rails.application.secrets[:twitter_consumer_secret]
      config.access_token        = Rails.application.secrets[:twitter_access_key]
      config.access_token_secret = Rails.application.secrets[:twitter_access_secret]
    end
  end

end
