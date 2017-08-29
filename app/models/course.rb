class Course < ActiveRecord::Base
	has_many :user_courses
  has_many :users, through: :user_courses
  has_many :contents
  before_save :downcase_fields


  def downcase_fields
  	self.name.downcase!
	end

  def in_charge
  	
  	@user_course = UserCourse.find_by(course_id: id, relation: "creo el curso")
  	User.find(@user_course.user_id)
  end

	def self.search(search)
	  if search
	    where('name LIKE ?', "%#{search.downcase}%")
	  else
	    Course.all
	  end
	end  
end
