class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, :set_current_user, if: :devise_controller?
    def after_sign_out_path_for(resource_or_scope)
        new_user_session_path 
    end

   
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def after_sign_in_path_for(user)
    if user.role == 0
      root_path
    elsif user.role ==1 
      tour_companies_path
    elsif user.role ==2
      root_path
    else root_path
    end
  end
end
