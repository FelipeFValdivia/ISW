class CoursesController < ApplicationController
	before_action :set_course, only: [:show, :update, :destroy]
	
	def index
		@courses = Course.all
		
	end

	def create
		@course = Course.new(course_params)
		@course.save

		if @course.errors.empty?

			@user_course =  UserCourse.new(user_id: current_user.id, course_id: @course.id, relation: "creo el curso").save
			
			redirect_to @course, notice: "Curso creado correctamente"
		
		else

			redirect_to new_course_path, notice: "Existió un error, por favor vuelva a intentarlo"
		
		end

	end

	def show
		
	end

	def update
		@course.update(course_params)
		respond_to do |format|
			if @course.errors.empty?
				format.html {redirect_to @course, notice: "Curso actualizado correctamente"}
				format.json {respond_with_bip(@course)}
			else
				format.html {redirect_to @course, notice: "El curso no pudo ser actualizado"}
				format.json {respond_with_bip(@coursse)}
			end
		end
	end

	def new
		@course = Course.new
	end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course

    @course = Course.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def course_params
    params.require(:course).permit( :name, 
                                  :description)
  end	
end
