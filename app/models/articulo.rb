class Articulo < ApplicationRecord
	belongs_to :rubro

	def self.search(interno, codigo, descripcion, rubro = nil)
    
    scope = Articulo.all
    
	  if interno.present?
	  	    arts = Articulo.where("interno = '#{interno}'")
	  elsif codigo.present?
	  		arts = Articulo.where("codigo ILIKE '#{codigo}%'").order('codigo')
	  elsif descripcion.present?
	  		arts = Articulo.where("descripcion ILIKE '#{descripcion}%'").order('descripcion')
	  elsif rubro.present?
	  	    arts = arts.joins(:rubro).where("rubro_id = '#{rubro}'")
	  else
	        scope.first(10)
	  end
	  arts
	end  

end
