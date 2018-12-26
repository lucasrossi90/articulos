@articulos = Articulo.all
@articulos.each do |articulo|
	i = articulo.interno.delete(' ')
	c = articulo.codigo.delete(' ')
	d = articulo.descripcion.delete(' ')
	u = articulo.ubicacion.delete(' ')
	articulo.update(:interno => i, :codigo => c, :descripcion => d, :ubicacion => u)
	end