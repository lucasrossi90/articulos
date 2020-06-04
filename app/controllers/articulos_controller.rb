class ArticulosController < ApplicationController

   def new
      nuevoInterno = buscarUltimoInterno
   		@articulo = Articulo.new
      @articulo.interno = nuevoInterno
   		@rubros = Rubro.all.order(:nombre)
   		@proveedores = Proveedor.all.order(:nombre)
      respond_to do |format|
        format.html
        format.js
      end
   end

   def create
   @articulo = Articulo.new(articulo_params)
   	if @articulo.save
  		redirect_to articulos_path
  	else
  		render 'index'
  	end
   end

   def delete
      @articulo = Articulo.find(params[:id])
      @rubros = Rubro.all.order(:nombre)
      respond_to :js
   end

   def destroy
   @articulo = Articulo.find(params[:id])
   if @articulo.destroy
      respond_to :js
    else
      render 'index'
    end
   end

   def index
        @rubros = Rubro.all.order(:nombre)
    	  @articulos = Articulo.order(:interno).first(10)
   end

   def search
   	      @articulos = Articulo.search(params[:interno], params[:codigo], params[:descripcion], 
   	      				params[:checkCodigo], params[:checkDescripcion], params[:rubro])
  	      respond_to :js
   end

   def edit
   		@articulo = Articulo.find(params[:id])
   		@rubros = Rubro.all.order(:nombre)
   		@proveedores = Proveedor.all.order(:nombre)
   		respond_to do |format|
   			format.html
   			format.js { render layout: false }
   		end
   end

  def update
    @articulo = Articulo.find(params[:id])
    if @articulo.update(articulo_params)
       respond_to :js
	  end
  end

  def buscarUltimoInterno
      ultimo = Articulo.order(:interno).last.interno
      nuevoInterno = ultimo + 1      
  end

  private

  def articulo_params
    params.require(:articulo).permit(:interno, :codigo, :descripcion,  
    									:rubro_id, :proveedor_id, :costo, :ganancia,
    									 :precio, :fecha_precio, :ubicacion)
  end

end
