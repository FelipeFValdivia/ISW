class MaterialsController < ApplicationController
	before_action :set_content
	before_action :set_course
	before_action :set_material
	before_action :has_student_permission?, only: [:show_to_student]
	before_action :has_teacher_or_expert_permission?, only: [:show, :update]

	def show
		
	end

	def update
		pp ""
		pp ""
		pp ""
		pp ""
		pp ""
		@material.update(material_params)
		pp @material
	end


	private

	def set_material
		@material = Material.find(params[:material_id])

	end

	def set_content
		@content = Content.find(params[:content_id])
	end

	def set_course
		@course = Course.find(params[:id])		
	end

	def material_params
		params.require(:material).permit(:learning_type)
	end

end
