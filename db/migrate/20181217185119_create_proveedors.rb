class CreateProveedors < ActiveRecord::Migration[5.2]
  def change
    create_table :proveedors do |t|
      t.string :nombre
      t.string :descuento

      t.timestamps
    end
  end
end
