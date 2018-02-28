class CreateTwitterAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :twitter_accounts do |t|
      t.string :screen_name
      t.string :twitter_id
      t.timestamps
    end
  end
end
