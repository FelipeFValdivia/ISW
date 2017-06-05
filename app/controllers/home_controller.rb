class HomeController < ApplicationController
	def redirect
		render_specific_view
	end
	def expert_index
		
	end

	def teacher_index

	end

	def normal_user_index
		redirect_to student_profile_user_path(id: current_user.id) if current_user.name.nil? 
	end



	private
	def render_specific_view
		case current_user.permission_level
		when "admin"
			redirect_to index_expert_path
		when "expert"
			redirect_to index_expert_path
		when "teacher"
			redirect_to index_teacher_path
		when nil
			redirect_to index_student_path
		end
	end

end


