class Reply < ApplicationRecord
  belongs_to :tweet
  validates_presence_of :tweet
  validates_presence_of :text
end
