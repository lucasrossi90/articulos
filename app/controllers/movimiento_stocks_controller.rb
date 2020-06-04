class MovimientoStocksController < ApplicationController

	def index
	end

	def search
		@articulo = Artiulo.search(params[:interno], params[:input_id])
		respond_to :js
	end

	def nueva_entrada
		@movimiento_stock = MovimientoStock.new(:tipoMovimiento => 'entrada')
		@producto_movido = ProductoMovido.new
   		@proveedores = Proveedor.all.order(:nombre)
   		respond_to :js
   	end

   	def movimiento_stock_params
   		params.require(:movimiento_stock).permit(:tipomovimiento, producto_movidos_attributes: [:interno,
   													:descripcion, :cantidad, :codigo, :proveedor, :_destroy])
   	end
end
