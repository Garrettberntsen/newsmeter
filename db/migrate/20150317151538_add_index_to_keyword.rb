class AddIndexToKeyword < ActiveRecord::Migration
  def change
  	add_index :keywords, :keyword, :unique => true, :case_sensitive => false
  end
end
