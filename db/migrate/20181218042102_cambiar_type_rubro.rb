class CambiarTypeRubro < ActiveRecord::Migration[5.2]
  def change
  	  	change_column :articulos, :rubro, 'integer USING CAST(rubro AS integer)'
  end
end
