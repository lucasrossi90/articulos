class ListadoStocksController < ApplicationController

	def new
		@proveedores = Proveedor.all.order(:nombre)
		@rubros = Rubro.all.order(:nombre)
		tipoListado = params[:tipo_listado]

		render "listado_stocks/mostrar_listado.js.erb", locals: {tipo: tipoListado}
	end

	def generar_listado

		if params[:fecha_desde].present?
			fecha_desde = params[:fecha_desde]
			fecha_desde = Date.parse(fecha_desde)
		end

		if params[:fecha_hasta].present?
			fecha_desde = params[:fecha_desde]
			fecha_desde = Date.parse(fecha_desde)
		end

		@productos = MovimientoStock.buscar_prods(params[:interno], params[:tipo_movimiento],
										params[:proveedor_id], fecha_desde, params[:fecha_hasta],
										params[:rubro], params[:referencia])
		respond_to :js
	end

	private
   	def listado_stock_params
   		params.require(:listado_stock).permit(:tipo_movimiento, :tipo_listado, :proveedor_id, :fecha_desde,
   													:fecha_hasta, :interno)
   	end
end
