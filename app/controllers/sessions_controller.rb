class SessionsController < ApplicationController
    def create 
        @user = User.find_by(email: params[:email])

        if @user && @user.authenticate(params[:password]) 
            session[:user_id] = @user.id 
            redirect_to root_path 
        else 
            message = "Hmm, Your sure this ur details? Check agin homie!"
            redirect_to login_path, notice: message
        end
    end

    def home
        render 'home'
    end
end
