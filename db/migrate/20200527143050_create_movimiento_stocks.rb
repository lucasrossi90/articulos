class CreateMovimientoStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :movimiento_stocks do |t|
      t.string :tipoMovimiento
      t.integer :articulo
      t.integer :proveedor
      t.timestamp :fecha

      t.timestamps
    end
  end
end
