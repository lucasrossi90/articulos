class CambiarTipoProveedor < ActiveRecord::Migration[5.2]
  def change
  	  	  change_column :listado_stocks, :proveedor_id, 'integer USING CAST(proveedor_id AS integer)'
  end
end
