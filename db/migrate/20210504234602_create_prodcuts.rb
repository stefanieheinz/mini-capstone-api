class CreateProdcuts < ActiveRecord::Migration[6.1]
  def change
    create_table :prodcuts do |t|
      t.string :name
      t.integer :price
      t.string :image_url
      t.string :description

      t.timestamps
    end
  end
end
