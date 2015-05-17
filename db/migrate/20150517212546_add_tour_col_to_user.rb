class AddTourColToUser < ActiveRecord::Migration
  def change
    add_column :users, :finished_tour, :boolean, :default => false
  end
end
