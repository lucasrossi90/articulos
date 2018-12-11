class AgregarColumnaUbicacion < ActiveRecord::Migration[5.2]
  def change
  	add_column :articulos, :ubicacion, :string
  end
end
