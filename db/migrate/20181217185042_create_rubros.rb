class CreateRubros < ActiveRecord::Migration[5.2]
  def change
    create_table :rubros do |t|
    	t.string :nombre

      t.timestamps
    end
  end
end
