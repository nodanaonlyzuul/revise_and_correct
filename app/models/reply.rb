class Reply < ApplicationRecord
  belongs_to :tweet
  validates_presence_of :tweet
  validates_presence_of :text
  scope :recently_replied, -> { where('created_at > ?', 48.hours.ago) }
end
