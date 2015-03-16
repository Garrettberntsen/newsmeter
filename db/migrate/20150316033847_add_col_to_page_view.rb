class AddColToPageView < ActiveRecord::Migration
  def change
  	add_column :page_views, :ended_at, :timestamp
  end
end
