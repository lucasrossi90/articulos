class CambiarProveedorId < ActiveRecord::Migration[5.2]
  def change
  	  rename_column :articulos, :proveedor, :proveedor_id
  end
end
