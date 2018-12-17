class ArticulosController < ApplicationController
   
   def index
        @rubros = Articulo.rubros
    	@articulos = Articulo.first(10)
   end

   def search
   	      @articulos = Articulo.search(params[:interno], params[:codigo], params[:descripcion, params[:rubro]])
          respond_to :js
   end

  private

  def search_params
  	params.permit(:interno, :codigo)
  end
end
