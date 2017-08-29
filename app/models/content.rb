class Content < ActiveRecord::Base
	belongs_to :course
	has_many :materials

	def self.search(search)
	  if search
	    where('name LIKE ?', "%#{search}%")
	  else
	    Course.all
	  end
	end  	
end
