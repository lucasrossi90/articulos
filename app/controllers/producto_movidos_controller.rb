class ProductoMovidosController < ApplicationController

	def new
	end

	def producto_movido_params
    params.require(:producto_movido).permit(:_destroy, :interno, :codigo,
    										:descripcion, :cantidad, :proveedor)
	end

end
