class SetInternoComoUnique < ActiveRecord::Migration[5.2]
  def change
  	add_index :articulos, :interno, unique: true
  end
end
