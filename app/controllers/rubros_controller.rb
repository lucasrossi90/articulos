class RubrosController < ApplicationController

  def new
     nuevoRubro = buscarUltimoRubro
     @rubro = Rubro.new
     @rubro.id = nuevoRubro
     respond_to do |format|
        format.html
        format.js
      end
  end

	def index
		@rubros = Rubro.all.order(:id)
	end

	def edit
		@rubro = Rubro.find(params[:id])
		respond_to do |format|
   			format.html
   			format.js
   		end
	end

	def search
		@rubros = Rubro.search(params[:nombre_rubro])
		respond_to :js
	end

	def update
    @rubro = Rubro.find(params[:id])
    if @rubro.update(rubro_params)
       respond_to :js
	  end
  	end

    def edit_fecha_rubro
  	  @rubros = Rubro.all.order(:nombre)
   	  respond_to do |format|
   			format.html
   			format.js
   	  end  
  	end

  	def edit_precio_rubro
  	  @rubros = Rubro.all.order(:nombre)
   	  respond_to do |format|
   			format.html
   			format.js
   	  end  
  	end

  	def rubro_articulos
  		@rubros = Rubro.all.order(:nombre)
  		@articulos = Articulo.order(:interno).first(5)
  	end

  	def search_articulos
  		@articulos = Rubro.search_articulos(params[:rubro_elegido], params[:orden])
  		respond_to :js
  	end

    def buscarUltimoRubro
      ultimo = Rubro.order(:id).last.id
      nuevoRubro = ultimo + 1      
    end

  	private
  	def rubro_params
  		params.require(:rubro).permit(:nombre)
  	end
end
