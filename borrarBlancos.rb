@articulos = Articulo.all
@articulos.each do |articulo|
	i = articulo.interno.rstrip
	c = articulo.codigo.rstrip
	d = articulo.descripcion.rstrip
	u = articulo.ubicacion.rstrip
	articulo.update(:interno => i, :codigo => c, :descripcion => d, :ubicacion => u)
	end