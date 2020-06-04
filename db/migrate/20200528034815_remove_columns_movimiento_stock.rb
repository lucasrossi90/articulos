class RemoveColumnsMovimientoStock < ActiveRecord::Migration[5.2]
  def change
  	remove_column :movimiento_stocks, :articulo
  	remove_column :movimiento_stocks, :proveedor
  	remove_column :movimiento_stocks, :fecha
  end
end
