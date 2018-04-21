class AddTwitterSecretsToUser < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.string :key, :secret, default: nil
    end
  end
end
