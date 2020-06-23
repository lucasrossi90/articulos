class ProductoMovido < ApplicationRecord
	belongs_to :articulo
	validates_presence_of :articulo
	belongs_to :movimiento_stock
	attr_accessor(:articulo_id, :interno, :cantidad, :codigo, :descripcion, :producto_movidos_attributes)
	
end
