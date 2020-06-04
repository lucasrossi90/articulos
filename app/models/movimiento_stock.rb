class MovimientoStock < ApplicationRecord
	has_many :producto_movidos
	accepts_nested_attributes_for :producto_movidos

	def self.search (input_interno)
		articulo = Articulo.where("interno = '#{input_interno}'")
		articulo
	end

end
