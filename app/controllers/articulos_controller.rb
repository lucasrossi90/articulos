class ArticulosController < ApplicationController
   
   def create
  	@articulo = Article.new(params[:interno], params[:codigo], params[:descripcion], params[:rubro])
 
  	if @articulo.save
    	redirect_to @articulo
  		else
    	render 'index'
  		end
	end

   def index
        @rubros = Rubro.all.order(:nombre)
    	@articulos = Articulo.first(10)
   end

   def search
   	      @articulos = Articulo.search(params[:interno], params[:codigo], params[:descripcion],
   	      								 params[:rubro], params[:checkCodigo], params[:checkDescripcion])
   	      respond_to :js
   end

   def edit
   		@articulo = Articulo.find(params[:id])
   		@rubros = Rubro.all.order(:nombre)
   		@proveedores = Proveedor.all.order(:nombre)
   		
   end

  def update
    @articulo = Articulo.find(params[:id])
    if @articulo.update_attributes(articulo_params)
      flash[:success] = "Articulo actualizado"
      redirect_to edit_articulo_path(@articulo)
    else
      render 'edit'
    end
  end

   private

    def articulo_params
      params.permit(:codigo, :descripcion, :password, :rubro_id)
    end

end
