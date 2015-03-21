class AddIndexToSites < ActiveRecord::Migration
  def change
  	add_index :sites, :domain, :unique => true
  end
end
