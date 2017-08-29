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
		when "convergente"
			"convergente"
		when "asimilador"
			"asimilador"
		when "adaptador"
			"adaptador"
		when "divergente"
			"divergente"
		else
			"Aún no selecciona tipo de aprendizaje"
		end
	end


end
