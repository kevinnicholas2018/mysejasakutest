class CreateUrlCustoms < ActiveRecord::Migration[5.1]
  def change
    create_table :url_customs do |t|
    	t.string :url_name
    	t.belongs_to :url_original
      t.timestamps
    end
  end
end
