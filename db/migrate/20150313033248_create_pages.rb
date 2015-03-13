class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :user_id
      t.string :actual_url
      t.string :og_url
      t.string :og_title
      t.string :og_type

      t.timestamps
    end
  end
end
