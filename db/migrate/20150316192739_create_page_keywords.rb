class CreatePageKeywords < ActiveRecord::Migration
  def change
    create_table :page_keywords do |t|
      t.references :page, index: true
      t.references :keyword, index: true

      t.timestamps
    end
  end
end
