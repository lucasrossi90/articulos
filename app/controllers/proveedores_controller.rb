class ProveedoresController < ApplicationController

  def index
  		@proveedores = Proveedor.all.order(:id)
  end

  def new
      nuevoProveedor = buscarUltimoProveedor
      @proveedor = Proveedor.new
      @proveedor.id = nuevoProveedor
      respond_to do |format|
          format.html
          format.js
      end
  end

   def create
   @proveedor = Proveedor.new(proveedor_params)
    if @proveedor.save
      redirect_to proveedores_path
    else
      render 'index'
    end
   end

  def edit
  	@proveedor = Proveedor.find(params[:id])
  	respond_to do |format|
     	format.html
     	format.js
     	end
  end

  def buscarUltimoProveedor
      ultimo = Proveedor.order(:id).last.id
      nuevoProveedor = ultimo + 1      
  end

  def update
      @proveedor = Proveedor.find(params[:id])
      if @proveedor.update(rubro_params)
         respond_to :js
  	  end
  end

  def search
  	@proveedores = Proveedor.search(params[:nombre_proveedor])
  	respond_to :js
  end


private
  	def proveedor_params
  		params.require(:proveedor).permit(:nombre)
  	end

end
