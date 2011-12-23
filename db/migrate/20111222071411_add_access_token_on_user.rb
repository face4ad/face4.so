class AddAccessTokenOnUser < ActiveRecord::Migration
  def up
    add_column :users, :access_token, :text
    add_column :users, :access_token_secret, :text
  end

  def down
    remove_column :users, :access_token
    remove_column :users, :access_token_secret
  end
end
