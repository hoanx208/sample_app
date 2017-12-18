class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    return if @user = User.find_by(id: params[:id])
    flash[:error] = t".no_user"
    redirect_to @user
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "welcome to the sample app"
      redirect_to @user
    else
      render "new"
    end
  end

  private
  def user_params
    params.require(:user)
      .permit :name, :email, :password, :password_confrimation
  end
end
