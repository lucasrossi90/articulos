class AddUniqueToRubro < ActiveRecord::Migration[5.2]
  def change
  	add_index :rubros, :id, unique: true
  end
end
