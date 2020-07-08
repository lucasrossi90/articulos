class AddReferenciaMovimientoStock < ActiveRecord::Migration[5.2]
  def change
  	add_column :movimiento_stocks, :referencia, :integer
    change_column_null :movimiento_stocks, :referencia, false, 0
  end
end
