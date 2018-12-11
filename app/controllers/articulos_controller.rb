class ArticulosController < ApplicationController
   
   def index
    	@articulos = Articulo.first(10)
    end

    def search
          @articulos = Articulo.search(params[:search].split("=").last)
          respond_to :js
    end

  


  private

  def search_params
  end
end
