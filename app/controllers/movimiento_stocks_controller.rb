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
  		
  		if @movimiento_stock.referencia.nil?
  			@movimiento_stock.referencia = "sin referencia"
      end
  			
  		if @movimiento_stock.save
			respond_to do |format|
		    format.js
		    end
		end
	end

	def nuevo_movimiento
		@movimiento_stock = MovimientoStock.new(tipo_movimiento: params[:tipo_movimiento])
		@producto_movido = ProductoMovido.new
   		@proveedores = Proveedor.all.order(:nombre)
   		respond_to :js
  end

   	private
   	def movimiento_stock_params
   		params.require(:movimiento_stock).permit(:tipo_movimiento, :referencia, :tipo_listado, :proveedor_id, 
   													producto_movidos_attributes: [:id, :articulo_id,
   													:interno, :descripcion, :cantidad, :codigo, :_destroy])
   	end
end

