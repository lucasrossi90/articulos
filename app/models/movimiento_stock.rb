class MovimientoStock < ApplicationRecord
	belongs_to :proveedor
	has_many :producto_movidos
	accepts_nested_attributes_for :producto_movidos
	before_save :actualizar_stock

	private
		def actualizar_stock
		
		end

	
end
