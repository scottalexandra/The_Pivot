class UsersController < ApplicationController
	include UsersHelper
  before_filter :authorize, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:fullname,
                                 :email,
                                 :password,
																 :password_confirmation,
                                 :display_name)
  end
end
