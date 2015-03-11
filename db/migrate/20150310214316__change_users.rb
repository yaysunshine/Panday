class ChangeUsers < ActiveRecord::Migration
  def change
    remove_column :users, :instagram_id, :integer
    add_column :users, :username, :string
    add_column :users, :oauth_token, :string
    add_column :users, :oauth_secret, :string
  end
end
