class EliminarCodigoProveedor < ActiveRecord::Migration[5.2]
  def change
  	remove_column :articulos, :codigo_proveedor
  end
end
