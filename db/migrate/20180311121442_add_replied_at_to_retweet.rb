class AddRepliedAtToRetweet < ActiveRecord::Migration[5.1]
  def change
    add_column :retweets, :replied_at, :timestamp, default: nil
  end
end
