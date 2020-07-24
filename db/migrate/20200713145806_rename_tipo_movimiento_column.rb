class RenameTipoMovimientoColumn < ActiveRecord::Migration[5.2]
  def change
  	rename_column :movimiento_stocks, :tipoMovimiento, :tipo_movimiento

  end
end
