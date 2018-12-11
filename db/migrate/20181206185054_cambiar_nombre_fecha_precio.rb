class CambiarNombreFechaPrecio < ActiveRecord::Migration[5.2]
  def change
  	rename_column :articulos, :echa_precio, :fecha_precio
  end
end
