class RegistrationsController < Devise::RegistrationsController

  # GET /resource/sign_up
  def new
    logger.debug "checking whether the user is login through sina"
    redirect_to root_path and return if session[:sina_id].nil?
    logger.debug "already login through sina, show registration sign up form"
    super
  end

  

  def after_inactive_sign_up_path_for(resource)
    if user.active 
      dashboard_path
    else
      logger.debug "after inactive sign up,  redirecting to random question page"
      show_random_reg_question_path
    end
  end

  def after_sign_up_path_for(resource)
    if user.active 
      dashboard_path
    else
      logger.debug "after sign up,  redirecting to random question page"
      show_random_reg_question_path
    end
  end

end 
