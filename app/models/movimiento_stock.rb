class MovimientoStock < ApplicationRecord
	belongs_to :proveedor
	has_many :producto_movidos
	before_save :actualizar_stock
	accepts_nested_attributes_for :producto_movidos


	def self.buscar_prods(interno_input, tipo_movimiento, proveedor, fecha_desde, fecha_hasta, rubro, referencia)
	
		case tipo_movimiento
			when 'Entrada y salida'
			prods = ProductoMovido.joins("JOIN movimiento_stocks on movimiento_stocks.id = producto_movidos.movimiento_stock_id").
					where("(movimiento_stocks.tipo_movimiento = 'entrada' OR movimiento_stocks.tipo_movimiento = 'salida')")
			
			when 'solo Entrada'
			prods = ProductoMovido.joins("JOIN movimiento_stocks on movimiento_stocks.id = producto_movidos.movimiento_stock_id").
			where("movimiento_stocks.tipo_movimiento = 'entrada'")

			when 'solo Salida'
			prods = ProductoMovido.joins("JOIN movimiento_stocks on movimiento_stocks.id = producto_movidos.movimiento_stock_id").
			where("movimiento_stocks.tipo_movimiento = 'salida'")

			when 'solo Ajuste'
			prods = ProductoMovido.joins("JOIN movimiento_stocks on movimiento_stocks.id = producto_movidos.movimiento_stock_id").
			where("movimiento_stocks.tipo_movimiento = 'ajuste'")

		end

		if interno_input.present?
			prods = prods.where("interno = '#{interno_input}'")
		end
		
		if proveedor.present?
			prods = prods.joins("JOIN movimiento_stocks on movimiento_stocks.id = producto_movidos.movimiento_stock_id").
			where("movimiento_stocks.proveedor_id = #{proveedor}")
		end
		
		if fecha_desde.present?
			prods = prods.where("producto_movidos.created_at > '#{fecha_desde}'")
		end

		if fecha_hasta.present?
			prods = prods.where("producto_movidos.created_at < '#{fecha_hasta}'")
		end

		if rubro.present?
			prods = prods.joins("JOIN articulos on producto_movidos.articulo_id = articulos.id").
			where("articulos.rubro_id = #{rubro}")
		end

		if referencia.present?
			prods = prods.joins("JOIN movimiento_stocks on movimiento_stocks.id = producto_movidos.movimiento_stock_id").
			where("movimiento_stocks.referencia = #{referencia}")
		end

		prods.order(created_at: :desc)
	end
	

		private
		def actualizar_stock
			@productos = self.producto_movidos
			
			case self.tipo_movimiento
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

