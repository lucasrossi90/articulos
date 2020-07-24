module ProductoMovidosHelper

	def diaMesAnio(fecha)
		if fecha.present?
			fecha.strftime("%d-%m-%Y")
		else
			"-"
		end
	end
	
end
