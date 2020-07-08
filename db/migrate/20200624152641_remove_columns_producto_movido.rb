class RemoveColumnsProductoMovido < ActiveRecord::Migration[5.2]
  def change
  	remove_column :producto_movidos, :fecha
  	remove_column :producto_movidos, :articulos_id
  end
end
