class ChangeDefaultArticuloStock < ActiveRecord::Migration[5.2]
  def change
  	 change_column_null :articulos, :stock, false, 0
  end
end
