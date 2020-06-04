class ProductoMovido < ApplicationRecord
	attr_accessor(:interno, :proveedor, :fecha, :cantidad, :codigo, :descripcion, :producto_movidos_attributes)
	
end
