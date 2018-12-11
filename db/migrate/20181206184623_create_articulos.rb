class CreateArticulos < ActiveRecord::Migration[5.2]
  def change
    create_table :articulos do |t|
      t.integer :interno
      t.string :codigo
      t.string :descripcion
      t.string :proveedor
      t.decimal :costo
      t.date :echa_precio
      t.integer :descuento
      t.decimal :precio
      t.text :comentarios

      t.timestamps
    end
  end
end
