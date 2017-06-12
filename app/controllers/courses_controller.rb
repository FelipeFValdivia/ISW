class CoursesController < ApplicationController
	before_action :has_student_permission?, only: [:show_to_student, :student_index, :enrollm, :show_enrolled]
	before_action :has_teacher_or_expert_permission?, only: [:index, :create, :show, :update, :new]
	before_action :set_course, only: [:show, :update, :destroy, :show_to_student, :enroll, :show_enrolled]

	def index
		@courses = current_user.enabled_courses
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

	def enroll
		@user_course = UserCourse.new(course_id: @course.id, user_id: current_user.id, relation: "Estudiante")
		@user_course.save
		if @user_course.errors.empty? 
			redirect_to show_enrolled_course_path(id: @course.id), notice: "Curso inscrito con éxito"
		else
			redirect_to show_to_student_course_path(id: @course.id), notice: "Curso no pudo ser inscrito"

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

	def student_index
		@courses = current_user.enabled_courses
		@enrolled_courses = current_user.enrolled_courses
	end

	def show_to_student
		
	end

	def show_enrolled
		
	end

  private

  def has_student_permission?
  	has_permission?([nil])
  end

  def has_teacher_or_expert_permission?
  	has_permission?(["teacher", "expert"])
  	
  end

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
