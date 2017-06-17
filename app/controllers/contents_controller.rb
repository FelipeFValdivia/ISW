class ContentsController < ApplicationController
	before_action :set_content, only: [:show, :update, :search_content]
	before_action :set_course_content, only: [:show, :create, :new]
	
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
		
	end

	private

	def set_content
		@content = Content.find(params[:content_id])
	end

	def set_course_content
		@course = Course.find(params[:id])
	end

	def content_params
		params.require(:content).permit(:name,
																		:description,
																		:course_id)
	end



end
