class ChangeDataTypes < ActiveRecord::Migration
  def change
  	change_column :pages, :description, :text
  	change_column :pages, :keywords, :text
  end
end
