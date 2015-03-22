class UpdateSeveralTables < ActiveRecord::Migration
  def change
  	add_index :sites, :domain, :unique => true
  	add_column :page_views, :ip_address, :string
  end
end
