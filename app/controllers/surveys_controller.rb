class SurveysController < ApplicationController

	def answer
		pp params
	
	end

	def process_answer
		
		total_ec = 0
		total_or = 0
		total_ea = 0
		total_ca = 0

		11.times do |i|
			total_ec += params["q" + (i + 1).to_s + "_ec"].to_i
			total_or += params["q" + (i + 1).to_s + "_or"].to_i
			total_ea += params["q" + (i + 1).to_s + "_ea"].to_i
			total_ca += params["q" + (i + 1).to_s + "_ca"].to_i
		end

		ca_ec = total_ca - total_ec
		ea_or = total_ea - total_or

		if ea_or > 0 and ca_ec > 0
			current_user.update(learning_style: "convergente")

		elsif ea_or > 0 and ca_ec < 0
			current_user.update(learning_style: "adaptador")

		elsif ea_or < 0 and ca_ec > 0
			current_user.update(learning_style: "asimilador")
		else
			current_user.update(learning_style: "divergente")
		end

		redirect_to student_profile_user_path(id: current_user.id)
				
	end

end