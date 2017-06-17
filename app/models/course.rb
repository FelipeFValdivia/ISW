class Course < ActiveRecord::Base
	has_many :user_courses
  has_many :users, through: :user_courses
  has_many :contents

  def in_charge
  	
  	@user_course = UserCourse.find_by(course_id: id, relation: "creo el curso")
  	User.find(@user_course.user_id)
  end

	def self.search(search)
	  if search
	    where('name LIKE ?', "%#{search}%")
	  else
	    Course.all
	  end
	end  
end
