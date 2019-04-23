class ArticulosDefaultCero < ActiveRecord::Migration[5.2]
  def change
  	  change_column_null :articulos, :ganancia, false, 0
  	  change_column_null :articulos, :costo, false, 0
  	  change_column_null :articulos, :precio, false, 0
  	        
	  change_column_default :articulos, :ganancia, 0
  	  change_column_default :articulos, :costo, 0
  	  change_column_default :articulos, :precio, 0
  end
end

