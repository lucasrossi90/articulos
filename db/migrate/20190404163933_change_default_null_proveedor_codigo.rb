class ChangeDefaultNullProveedorCodigo < ActiveRecord::Migration[5.2]
  def change
  	  change_column_null :articulos, :proveedor_id, false, 2
  	  change_column_null :articulos, :codigo, false, "SIN CODIGO"
  	        
	  change_column_default :articulos, :proveedor_id, 2
  end
end
