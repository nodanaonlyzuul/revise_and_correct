class AddOriginalPayloadToTwitterAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :twitter_accounts, :original_response, :jsonb
  end
end
