class MovimientoStocksController < ApplicationController

	def index
	end

	def search
		@articulo = Articulo.search_stock(params[:interno])
		@articulo.to_json
	 		render json: @articulo
  	end

  	def create
  		@movimiento_stock = MovimientoStock.new(movimiento_stock_params)
  		if @movimiento_stock.save
			respond_to do |format|
		    format.js
		    end
		end
	end

	def nueva_entrada
		@movimiento_stock = MovimientoStock.new(:tipoMovimiento => 'entrada')
		@producto_movido = ProductoMovido.new
   		@proveedores = Proveedor.all.order(:nombre)
   		respond_to :js
   	end

   	private
   	def movimiento_stock_params
   		params.require(:movimiento_stock).permit(:tipomovimiento, producto_movidos_attributes: [:id, :interno,
   													:descripcion, :cantidad, :codigo, :proveedor, :_destroy])
   	end
end
