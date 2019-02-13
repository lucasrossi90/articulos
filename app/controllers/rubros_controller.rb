class RubrosController < ApplicationController

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

    def update_fecha_rubro
  	  @rubros = Rubro.all.order(:nombre)
   	  respond_to do |format|
   			format.html
   			format.js
   	  end  
  	end


  	private
  	def rubro_params
  		params.require(:rubro).permit(:nombre)
  	end
end
