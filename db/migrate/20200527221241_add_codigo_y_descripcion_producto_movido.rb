class AddCodigoYDescripcionProductoMovido < ActiveRecord::Migration[5.2]
  def change
   	  add_column :producto_movidos, :codigo, :string
   	  add_column :producto_movidos, :descripcion, :string
  end
end
