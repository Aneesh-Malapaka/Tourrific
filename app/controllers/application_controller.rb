class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, :set_current_user, if: :devise_controller?
  def after_sign_out_path_for(resource_or_scope)
      new_user_session_path 
  end
  # user methods
  def show
    @user = current_user
    puts @user 
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @current = current_user
    puts "current user is #{@current}"
    @user = User.find_by(id: @current.id)
    puts "THe User is #{@user.email}"
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
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

  private
  def user_params 
    params.require(:user).permit(:username, :phone, :country, :location)
  end
end
