class Material < ActiveRecord::Base
	belongs_to :content

	def spanish_type
		case material_type
		when "summary"
			"resumen"
		when "images"
			"imágen"
		when "url"
			"fuente"
		when "external"
			"contenido externo"			
		end
	end
end
