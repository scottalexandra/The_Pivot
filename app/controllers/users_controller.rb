class UsersController < ApplicationController
  before_filter :authorize, only: [:show]

  # def index
  #   @users = User.all
  # end

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

  def show
    @user = User.find(params[:id])
    authorize! :read, @user
  end
  private

  def user_params
    params.require(:user).permit(:fullname,
                                 :email,
                                 :password,
                                 :display_name)
  end
end