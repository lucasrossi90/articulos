class AddStockToArticulos < ActiveRecord::Migration[5.2]
  def change
  	add_column :articulos, :stock, :integer
  end
end
