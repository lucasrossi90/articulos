class MovimientoStock < ApplicationRecord
	has_many :producto_movidos
	accepts_nested_attributes_for :producto_movidos

	
end
