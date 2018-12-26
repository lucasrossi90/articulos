class Rubro < ApplicationRecord
	has_many :articulos

	def self.rubro
		self
	end

end
