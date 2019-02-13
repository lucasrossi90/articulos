class CambiarInternoAInteger < ActiveRecord::Migration[5.2]
  def change
  	change_column :articulos, :interno, :integer
  end
end
