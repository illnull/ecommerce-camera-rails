class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :price
      t.string :name
      t.string :description
      t.string :image
      t.integer :qty
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
