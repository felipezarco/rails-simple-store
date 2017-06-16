class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :image_url
      t.text :description
      t.decimal :price, precision: 4, scale: 2

      t.timestamps
    end
  end
end
