class RemoveCantidadMovimientoStock < ActiveRecord::Migration[5.2]
  def change
  	  	remove_column :movimiento_stocks, :cantidad
  end
end
