class MovimientoStock < ApplicationRecord
	has_many :producto_movidos
	belongs_to :proveedor
	accepts_nested_attributes_for :producto_movidos
	before_save :actualizar_stock

	private
		def actualizar_stock
		
		end

	
end
