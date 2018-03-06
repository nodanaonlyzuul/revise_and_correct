class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
      t.integer :twitter_account_id, index: true
      t.string :twitter_id, index: true
      t.integer :reply_id, index: true
      t.string  :text
      t.datetime :tweeted_at
      t.integer :retweets_count
      t.jsonb   :original_response
      t.timestamps
    end
  end
end
