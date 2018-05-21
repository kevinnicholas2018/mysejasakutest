class CreateUrlOriginals < ActiveRecord::Migration[5.1]
  def change
    create_table :url_originals do |t|
      t.string :url_name
      t.references :url_short
      t.references :url_custom
      t.timestamps
    end
  end
end
