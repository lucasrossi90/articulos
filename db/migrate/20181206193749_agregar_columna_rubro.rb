class AgregarColumnaRubro < ActiveRecord::Migration[5.2]
  def change
  	add_column :articulos, :rubro, :string
  end
end
