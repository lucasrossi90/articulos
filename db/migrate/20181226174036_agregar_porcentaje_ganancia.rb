class AgregarPorcentajeGanancia < ActiveRecord::Migration[5.2]
  def change
  	add_column :articulos, :ganancia, :decimal
  end
end
