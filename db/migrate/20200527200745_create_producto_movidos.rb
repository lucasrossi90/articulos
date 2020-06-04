class CreateProductoMovidos < ActiveRecord::Migration[5.2]
  def change
    create_table :producto_movidos do |t|
      t.integer :interno
      t.integer :proveedor
      t.timestamp :fecha
      t.integer :cantidad

      t.timestamps
    end
  end
end
