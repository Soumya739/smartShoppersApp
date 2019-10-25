class UsersController < ApplicationController
  before_action :redirect_user, only: [:show, :update, :destroy]
  before_action :check_params, only: [:create, :update]
  before_action :current_user, only: [:edit, :show, :update, :destroy]


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      session[:user_email] = @user.email
      @cart = Cart.create(user_id: @user.id)
      redirect_to smartshoppers_path
    else
      flash[:message] = "Invalid Input!! Try again!"
      redirect_to new_user_path
    end
  end

  def update
    @user.update(user_params)
    redirect_to user_path
  end

  def destroy
    @user.destroy
    session.clear
    redirect_to smartshoppers_path
  end

private

  def user_params
    params.require(:user).permit(:name, :address, :contact_num, :city, :email, :password, :password_confirmation)
  end

  def check_params
    params[:user][:name].capitalize!
    params[:user][:email].downcase!
  end

  def current_user
    @user = User.find(session[:user_id])
  end


end
