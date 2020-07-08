class MovimientoStock < ApplicationRecord
	belongs_to :proveedor
	has_many :producto_movidos
	before_save :actualizar_stock
	accepts_nested_attributes_for :producto_movidos

	private
		def actualizar_stock
			@productos = self.producto_movidos
			
			case self.tipoMovimiento
				when "entrada"
					@productos.each do |prod|
						prod_id = prod.articulo_id
						cantidad_entrada = prod.cantidad
						@articulo = Articulo.where(:id => prod_id).first
						@articulo.stock = @articulo.stock +  cantidad_entrada
						@articulo.save
					end
				when "salida"
					@productos.each do |prod|
						prod_id = prod.articulo_id
						cantidad_salida = prod.cantidad
						@articulo = Articulo.where(:id => prod_id).first
						@articulo.stock = @articulo.stock - cantidad_salida
						@articulo.save
					end
				when "ajuste"
					@productos.each do |prod|
						prod_id = prod.articulo_id
						cantidad_ajuste = prod.cantidad
						@articulo = Articulo.where(:id => prod_id).first
						@articulo.stock = cantidad_ajuste
						@articulo.save
					end
			end
		end
end
