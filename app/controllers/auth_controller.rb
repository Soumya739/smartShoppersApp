class AuthController < ApplicationController

  def signin
  end

  def varify
    @user = User.find_by(email: params[:auth][:email])
    return head(:forbidden) unless @user.authenticate(params[:auth][:password])
    if @user
      session[:user_id] = @user.id
      session[:user_email] = @user.email
      redirect_to smartshoppers_path
    else
      flash[:message] = "Incorrect Input!! Try again"
      render :signin
    end
  end

  def logout
    session.clear
    redirect_to smartshoppers_path
  end

end
