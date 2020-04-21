class AddSaleToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :sale, :interger
  end
end
