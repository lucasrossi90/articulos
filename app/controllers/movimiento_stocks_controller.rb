class MovimientoStocksController < ApplicationController

	def index
	end

	def search
		@articulo = Articulo.search_stock(params[:interno])
		@articulo.to_json
	 		render json: @articulo
  	end

  	def procesar_entrada
  		@movimiento_stock
  		byebug  	
	end

	def nueva_entrada
		@movimiento_stock = MovimientoStock.new(:tipoMovimiento => 'entrada')
		@producto_movido = ProductoMovido.new
   		@proveedores = Proveedor.all.order(:nombre)
   		respond_to :js
   	end

   	def movimiento_stock_params
   		params.require(:movimiento_stock).permit(:tipomovimiento, producto_movidos_attributes: [:id, :interno,
   													:descripcion, :cantidad, :codigo, :proveedor, :_destroy])
   	end
end
