class AddColsToPages < ActiveRecord::Migration
  def change
  	add_column :pages, :description, :string
  	add_column :pages, :keywords, :string
  end
end
