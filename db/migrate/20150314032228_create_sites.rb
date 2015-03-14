class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :domain
      t.string :organization
      t.string :nationality
      t.string :language

      t.timestamps
    end
  end
end
