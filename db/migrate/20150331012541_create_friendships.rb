class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :friend_id
      t.string :sharing_scope, default: 'restricted'
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :friendships, :users
  end
end
