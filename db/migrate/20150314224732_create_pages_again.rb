class CreatePagesAgain < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :canonical_url
      t.string :title
      t.string :page_type
      t.string :author
      t.references :site, index: true

      t.timestamps
    end
  end
end
