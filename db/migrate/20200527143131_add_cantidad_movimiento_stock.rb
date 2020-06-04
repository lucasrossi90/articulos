class AddCantidadMovimientoStock < ActiveRecord::Migration[5.2]
  def change
  	  add_column :movimiento_stocks, :cantidad, :integer
  end
end
