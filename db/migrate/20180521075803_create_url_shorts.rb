class CreateUrlShorts < ActiveRecord::Migration[5.1]
  def change
    create_table :url_shorts do |t|
      t.string :url_name
      t.belongs_to :url_original
      t.timestamps
    end
  end
end
