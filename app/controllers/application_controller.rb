class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  before_action :authenticate_user!
  layout :layout_by_resource

  def after_sign_in_path_for(resource)


    home_redirect_path
  end

  protected

  def has_permission? permission_array
    
    redirect_to home_redirect_path unless permission_array.include?(current_user.permission_level)
      
    
  end

  def layout_by_resource
    return 'expert_layout' if user_signed_in? and (current_user.permission_level == "expert" )
    return 'teacher_layout' if user_signed_in? and current_user.permission_level == "teacher"
    return 'application' if user_signed_in?
    'devise_layout'

  end

  def require_login
    redirect_to user_session_path, :notice => 'Antes inicia sesión' unless user_signed_in?
    ## if you want render 404 page
    ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
  end


  def has_student_permission?
    has_permission?([nil])
  end

  def has_teacher_or_expert_permission?
    has_permission?(["teacher", "expert"])
    
  end  

end
