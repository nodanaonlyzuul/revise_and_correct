class CreateRetweets < ActiveRecord::Migration[5.1]
  def change
    create_table :retweets do |t|
      t.string :twitter_id
      t.jsonb :original_response
      t.references :tweet, foreign_key: true
      t.timestamps
    end
  end
end
