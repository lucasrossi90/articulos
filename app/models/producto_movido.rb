class ProductoMovido < ApplicationRecord
	belongs_to :articulo
	attr_accessor(:interno, :proveedor, :fecha, :cantidad, :codigo, :descripcion, :producto_movidos_attributes)
	
end
