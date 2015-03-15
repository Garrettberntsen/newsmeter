class AddUniqueIndexToPages < ActiveRecord::Migration
  def change
  	add_index :pages, :canonical_url, :unique => true
  end
end
