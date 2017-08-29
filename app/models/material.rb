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

	def spanish_learning_type
		case learning_type
		when 1
			"convergente"
		when 2
			"divergente"
		when 3
			"asimilador"
		when 4
			"adaptador"
		else
			"Aún no selecciona tipo de aprendizaje"
		end
	end


end
