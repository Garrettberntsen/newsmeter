class DropTables < ActiveRecord::Migration
  def change
  	drop_table :identities
  	drop_table :users
  end
end
