class QuitarProveedorProductoMovido < ActiveRecord::Migration[5.2]
  def change
  	  	remove_column :producto_movidos, :proveedor
  end
end
