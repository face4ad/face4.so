class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|  
    flash[:error] = "Access denied!"  
    if current_user.nil? 
      redirect_to root_url  
    else
      redirect_to show_random_reg_question_path
    end
  end  

end
