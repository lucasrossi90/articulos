class Articulo < ApplicationRecord
	
	def self.search(search)
	  if search
	        Articulo.where("interno = '#{search}'")
	  else
	        Articulo.first(10)
	  end
    end  

end
