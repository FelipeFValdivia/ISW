class IndexController < ApplicationController
  def index
  	unless user_signed_in?
    	redirect_to user_session_path 
    else
    	redirect_to home_redirect_path
  	end
  end
end