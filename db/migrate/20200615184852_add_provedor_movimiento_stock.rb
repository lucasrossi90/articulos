class AddProvedorMovimientoStock < ActiveRecord::Migration[5.2]
  def change
  	  add_column :movimiento_stocks, :proveedor_id, :integer
  end
end
