class ProductoMovido < ApplicationRecord
	belongs_to :articulo
	validates_presence_of :articulo
	belongs_to :movimiento_stock
	before_save :definir_codigo_descripcion

	private
		def definir_codigo_descripcion
			@articulo = Articulo.where(:interno => self.interno).first
			self.codigo = @articulo.codigo
			self.descripcion = @articulo.descripcion
		end

end
