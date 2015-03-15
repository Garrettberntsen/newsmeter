class AddRefToPageViews < ActiveRecord::Migration
  def change
  	add_reference :page_views, :page, index: true
  end
end
