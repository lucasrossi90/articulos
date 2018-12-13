class ArticulosController < ApplicationController
   
   def index
    	@articulos = Articulo.first(10)
    end

    def search
          @articulos = Articulo.search(params[:search].split("=").last)
          render partial: 'index_content'
    end

  


  private

  def search_params
  end
end
