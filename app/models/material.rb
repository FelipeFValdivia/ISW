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
			"asimilador"
		when 3
			"adaptador"
		when 4
			"divergente"
		else
			"Aún no selecciona tipo de aprendizaje"
		end
	end




end
