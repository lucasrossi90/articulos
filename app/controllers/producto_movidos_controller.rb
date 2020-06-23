class ProductoMovidosController < ApplicationController

	def new
	end

	def producto_movido_params
    params.require(:producto_movido).permit(:_destroy, :articulo_id, :interno, :codigo,
    										:descripcion, :cantidad)
	end

end
