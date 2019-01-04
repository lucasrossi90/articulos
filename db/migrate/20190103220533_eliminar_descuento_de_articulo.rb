class EliminarDescuentoDeArticulo < ActiveRecord::Migration[5.2]
  def change
  	  remove_column :articulos, :descuento
  end
end
