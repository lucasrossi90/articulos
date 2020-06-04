class AddMovimientoStockIdToProductoMovido < ActiveRecord::Migration[5.2]
  def change
  	 add_column :producto_movidos, :movimiento_stock_id, :integer
  end
end
