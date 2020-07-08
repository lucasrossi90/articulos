class MovimientoStocksController < ApplicationController

	def index
	end

	def listados
		tipoListado = params[:tipoListado]
		case tipoListado
			when "articulo"
				render "movimiento_stocks/listado_stock_articulo.js.erb"
		end
	end

	def nuevo_listado
		tipoListado = params[:tipoListado]
		case tipoListado
			when "articulo"
				render :partial => "movimiento_stocks/listado_stock_articulo.js"
		end
	end

	def search
		@articulo = Articulo.search_stock(params[:interno])
		@articulo.to_json
	 		render json: @articulo
  	end

  	def create
  		@movimiento_stock = MovimientoStock.new(movimiento_stock_params)
  		
  		@movimiento_stock.referencia.nil?
  			@movimiento_stock.referencia = "sin referencia"
  			
  		if @movimiento_stock.save
			respond_to do |format|
		    format.js
		    end
		end
	end

	def nuevo_movimiento
		@movimiento_stock = MovimientoStock.new(tipoMovimiento: params[:tipoMovimiento])
		@producto_movido = ProductoMovido.new
   		@proveedores = Proveedor.all.order(:nombre)
   		respond_to :js
   	end

   	private
   	def movimiento_stock_params
   		params.require(:movimiento_stock).permit(:tipoMovimiento, :proveedor_id, 
   													producto_movidos_attributes: [:id, :articulo_id,
   													:interno, :descripcion, :cantidad, :codigo, :_destroy])
   	end
end

