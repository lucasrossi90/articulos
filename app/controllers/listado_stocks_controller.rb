class ListadoStocksController < ApplicationController

	def new
		@listado_stock = ListadoStock.new(tipo_listado: params[:tipo_listado])
		@proveedores = Proveedor.all.order(:nombre)
		tipoListado = params[:tipo_listado]
		case tipoListado
			when "articulo"
				render "listado_stocks/listado_stock_articulo.js.erb"
		end
	end

	def generar_listado
		case params[:tipo_listado]

		when 'articulo'
			@productos = MovimientoStock.buscar_prods_interno(params[:interno], params[:tipo_movimiento],
										params[:proveedor], params[:fecha_desde], params[:fecha_hasta])
		end
		respond_to :js
	end

	private
   	def movimiento_stock_params
   		params.require(:listado_stock).permit(:tipo_movimiento, :tipo_listado, :proveedor_id, :fecha_desde,
   													:fecha_hasta, :interno)
   	end
end
