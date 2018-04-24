class User < ApplicationRecord

  validates_presence_of :name
  validates_presence_of :screen_name
  validates_presence_of :email

  scope :with_twitter_credentials, -> { where.not(key: nil, secret: nil)}

end
