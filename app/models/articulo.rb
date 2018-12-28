class Articulo < ApplicationRecord
	belongs_to :rubro
	belongs_to :proveedor
		

	def self.search(interno, codigo, descripcion, checkCodigo, checkDescripcion, rubro = nil)
    
    arts = Articulo.all
    
	  if interno.present?
	  	    arts = Articulo.where("interno = '#{interno}'")
	  end	 
	  if codigo.present? && checkCodigo == 'true'
	  		arts = Articulo.where("codigo ILIKE '#%{codigo}%'").order('codigo')
	  	elsif codigo.present? && checkCodigo == 'false'
	  		arts = Articulo.where("codigo ILIKE '#{codigo}%'").order('codigo')
	  end
	  if descripcion.present? && checkDescripcion == 'true'
	  		arts = Articulo.where("descripcion ILIKE '#%{descripcion}%'").order('descripcion')
  		  elsif descripcion.present? && checkDescripcion == 'false'
	  		arts = Articulo.where("descripcion ILIKE '#{descripcion}%'").order('descripcion')
	  end
	  if rubro.present?
	  	    arts = Articulo.where("rubro_id = '#{rubro}'")
	  end
	  arts
	end  

end
