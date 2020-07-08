class AddDescuentoArticulo < ActiveRecord::Migration[5.2]
  def change
  	add_column :articulos, :descuento, :decimal
    change_column_null :articulos, :descuento, false, 20
  end
end
