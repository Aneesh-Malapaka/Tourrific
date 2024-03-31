# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  before_action :set_user_role, only: [:create]
  
  protected
  def after_sign_up_path_for(resource)
    puts "this is 1"
    new_user_session_path
  end

  def after_inactive_sign_up_path_for(resource)
    puts "this is 2"
    new_user_session_path
  end

  private
  
  def set_user_role
    @user.role = params[:user][:role].to_i  # Ensure conversion to integer
  end
  
  
    def create
      super
      @user.update(role: params[:user][:role].to_i)
    end
end

