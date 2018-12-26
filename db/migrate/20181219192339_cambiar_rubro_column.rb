class CambiarRubroColumn < ActiveRecord::Migration[5.2]
  def change
  	  rename_column :articulos, :rubro, :rubro_id
  end
end
