class ContentsController < ApplicationController
	before_action :set_content, only: [:show, :update, :search, :show_to_student]
	before_action :set_course, only: [:show, :update, :search, :show_to_student, :new, :create]
	before_action :has_student_permission?, only: [:show_to_student]
	before_action :has_teacher_or_expert_permission?, only: [:index, :create, :show, :update, :new]
	require 'wikipedia'

	def show
		
	end

	def new

		@content = Content.new
		
	end

	def create
		@content = Content.new(content_params)
		@content.course_id = @course.id
		@content.save
		if @content.errors.empty?
			redirect_to show_content_course_path(content_id: @content.id, id: @course.id), notice: "Contenido creado correctamente"
		else
			redirect_to @course, notice: "El contenido no pudo ser creado correctamente"
		end

	end

	def update
		@content.update(content_params)
		respond_to do |format|
			if @content.errors.empty?
				format.html {redirect_to show_content_course_path(content_id: @content.id, id: @course.id), notice: "Contenido actualizado correctamente"}
        format.json { respond_with_bip(@content) }
			else
				format.html {redirect_to show_content_course_path(content_id: @content.id, id: @course.id), notice: "Contenido no pudo ser actualizado"}
        format.json { render json: @client.errors, status: :unprocessable_entity }
			
			end
		end
	end

	def search
		if @content.materials.empty?
			@page = Wikipedia.find( @content.name, :domain => 'es.wikipedia.org')

			@summary = @page.summary
			Material.new(description: @summary, material_type: "summary" , content_id: @content.id).save
			@images = @page.image_descriptionurls
			@images.each do |image|
				Material.new(description: image, material_type: "images" , content_id: @content.id).save
			end
			@font = @page.fullurl.first
			Material.new(description: @font, material_type: "url" , content_id: @content.id).save
			@ext_links = @page.extlinks
			@ext_links.each do |ext|
				Material.new(description: ext, material_type: "external" , content_id: @content.id).save
			end
		else
			redirect_to home_redirect_path
		end
	
	end

	def show_to_student
		
	end

	private

	def set_content
		@content = Content.find(params[:content_id])
	end

	def set_course
		@course = Course.find(params[:id])		
	end

	def content_params
		params.require(:content).permit(:name,
																		:description,
																		:course_id)
	end



end
