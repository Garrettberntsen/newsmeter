class ChangePageName < ActiveRecord::Migration
  def change
  	rename_table :pages, :page_views
  end
end
