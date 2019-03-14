module ArticuloHelper
	def mesAnio(fecha)
		if fecha.present?
			fecha.strftime("%m-%Y")
		else
			"-"
		end
	end

	def mostrarPrecio(precio)
		if precio.present?
			precio.round(2)
		else
			"0"
		end
	end

	def diaMesAnio(fecha)
		if fecha.present?
			fecha.strftime("%d-%m-%Y")
		else
			"-"
		end
	end
	
end
