class RemoveCols < ActiveRecord::Migration
  def change
  	remove_column :page_views, :og_url
  	remove_column :page_views, :og_title
  	remove_column :page_views, :og_type
  	remove_column :page_views, :domain
  end
end
