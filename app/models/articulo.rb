class Articulo < ApplicationRecord
	belongs_to :rubro
	belongs_to :proveedor
	has_many :producto_movidos, inverse_of: :articulo
	validates :interno, presence: true
	
	def self.search(interno, codigo, descripcion, checkCodigo, checkDescripcion, rubro)
    
    arts = Articulo.all
    
	  if interno.present?
	  	    arts = arts.where("interno = '#{interno}'")
	  end	

	  if codigo.present? && checkCodigo == 'true'
	  		arts = arts.where("codigo ILIKE '%#{codigo}%'").order('codigo')
	  	elsif codigo.present? && checkCodigo == 'false'
	  		arts = arts.where("codigo ILIKE '#{codigo}%'").order('codigo')
	  end

	  if descripcion.present? && checkDescripcion == 'true'
	  		arts = arts.where("descripcion ILIKE '%#{descripcion}%'").order('descripcion')
  		  elsif descripcion.present? && checkDescripcion == 'false'
	  		arts = arts.where("descripcion ILIKE '#{descripcion}%'").order('descripcion')
	  end

	  if rubro.present?
	  	    arts = arts.where("rubro_id = '#{rubro}'")
	  end

	  arts.includes(:rubro)

	end  

	def self.search_stock (input_interno)
		articulo = Articulo.where("interno = '#{input_interno}'")
		articulo
	end

	
	def ultimo_interno
		ultimo = Articulo.order(:interno).last.interno
 		self.interno = (ultimo.try(:interno) || 0) + 1
	end

end
