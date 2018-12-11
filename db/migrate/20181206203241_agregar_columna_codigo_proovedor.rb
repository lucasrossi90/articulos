class AgregarColumnaCodigoProovedor < ActiveRecord::Migration[5.2]
  def change
  	add_column :articulos, :codigo_proveedor, :string
  end
end
