class ChangeReferencesNameToUserCourse < ActiveRecord::Migration
  def change
  	remove_reference :user_courses, :courses, index: true
  	remove_reference :user_courses, :users, index: true

  	add_reference :user_courses, :user, index: true
  	add_reference :user_courses, :course, index: true
  end
end
