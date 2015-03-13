class AddHost < ActiveRecord::Migration
  def change
  	add_column :pages, :domain, :string
  end
end
