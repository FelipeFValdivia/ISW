class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :set_first_birth_date
  has_many :user_courses
  has_many :courses, through: :user_courses

  def enabled_courses

    if permission_level.nil?
      current_courses = []
      user_courses.select(:course_id).each do |user_course|
        current_courses << user_course.course_id
      end

      @courses = Course.where.not(id: current_courses)

    elsif permission_level == "teacher"
      @courses = courses
    else
      @courses = Course.all

    end
  end

  def enrolled_courses
    courses
  end

  def is_my_course? course_id

    @course = Course.find(course_id)
    courses.include?(@course)
    
  end

  def student?
    permission_level == nil
    
  end

end
