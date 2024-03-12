class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.authenticate_with_credentials(params[:email],params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:alert] = "Email or Password incorrect"
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end
end
