class CreateListadoStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :listado_stocks do |t|
      t.string :tipo_movimiento
      t.string :proveedor
      t.timestamp :fecha_desde
      t.timestamp :fecha_hasta
      t.string :tipo_listado
      t.integer :interno

      t.timestamps
    end
  end
end
