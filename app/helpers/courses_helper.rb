module CoursesHelper
	def course_belongs_to_me? course_id
		current_user.is_my_course? course_id
	end
end
