class AddArticuloToProductoMovidos < ActiveRecord::Migration[5.2]
  def change
  	add_column :producto_movidos, :articulo_id, :integer
  	add_reference :producto_movidos, :articulos, index: true
    add_foreign_key :producto_movidos, :articulos
  end
end
