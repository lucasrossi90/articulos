class Rubro < ApplicationRecord
	has_many :articulos

	def self.rubro
		self
	end

	def self.search (nombre_rubro)
		query = Rubro.all
		query = Rubro.where ("nombre ILIKE '%#{nombre_rubro}%'")
		query
	end

	def self.search_articulos(rubro_elegido, orden)
		query = Articulo.all
		if orden.present?
		query = Articulo.where("rubro_id = '#{rubro_elegido}'").order(orden)
		else
		query = Articulo.where("rubro_id = '#{rubro_elegido}'").order(:interno)
		end
		query
	end
	
end
