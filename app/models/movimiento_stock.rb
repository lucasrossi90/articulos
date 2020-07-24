class MovimientoStock < ApplicationRecord
	belongs_to :proveedor
	has_many :producto_movidos
	before_save :actualizar_stock
	accepts_nested_attributes_for :producto_movidos


	def self.buscar_prods_interno(interno_input, tipo_movimiento, proveedor, fecha_desde, fecha_hasta)
	
		case tipo_movimiento
			when 'Entrada y salida'
			prods = ProductoMovido.joins("JOIN movimiento_stocks on movimiento_stocks.id = producto_movidos.movimiento_stock_id").where(
					"movimiento_stocks.tipo_movimiento = 'entrada' OR movimiento_stocks.tipo_movimiento = 'salida'
					AND producto_movidos.interno = '#{interno_input}'")
		end

		byebug
		if proveedor.present?
			prods = prods.joins("JOIN movimiento_stocks on movimiento_stocks.id = 
				producto_movidos.movimiento_stock_id").where("movimiento_stocks.proveedor_id = '#{proveedor}'")
		end
		
		if fecha_desde.present?
			prods = prods.joins("JOIN movimiento_stocks on movimiento_stocks.id = 
				producto_movidos.movimiento_stock_id").where("movimiento_stocks.created_date > '#{fecha_desde}'")
		end

		if fecha_hasta.present?
			prods = prods.joins("JOIN movimiento_stocks on movimiento_stocks.id = 
				producto_movidos.movimiento_stock_id").where("movimiento_stocks.created_date > '#{fecha_hasta}'")
		end

		prods
	end
	end

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


