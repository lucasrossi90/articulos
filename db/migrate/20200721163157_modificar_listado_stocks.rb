class ModificarListadoStocks < ActiveRecord::Migration[5.2]
  def change
  	  rename_column :listado_stocks, :proveedor, :proveedor_id
  end
end
