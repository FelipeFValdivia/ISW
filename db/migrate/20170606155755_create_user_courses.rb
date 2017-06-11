class CreateUserCourses < ActiveRecord::Migration
  def change
    create_table :user_courses do |t|
    	t.string :relation
    	t.references :courses, index: true
    	t.references :users, index: true
      t.timestamps null: false
    end
  end
end
