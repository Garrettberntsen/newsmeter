class ChangeColType < ActiveRecord::Migration
  def change
  	change_column :page_views, :actual_url, :text
  end
end
