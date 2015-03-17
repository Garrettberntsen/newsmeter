class RemoveColFromPage < ActiveRecord::Migration
  def change
  	remove_column :pages, :keywords
  end
end
