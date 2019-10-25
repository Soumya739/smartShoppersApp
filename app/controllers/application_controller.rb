class ApplicationController < ActionController::Base
  helper_method :logged_in?,

  def logged_in?
    !!session[:user_id]
  end

  def redirect_user
    if !logged_in?
      redirect_to smartshoppers_signin_path
    end
  end

  def redirect_non_admins
    if logged_in?
      if !(session[:user_email] == "soumgoel@gmail.com")
        redirect_user
      end
    end
  end

end
