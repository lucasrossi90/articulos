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

end
