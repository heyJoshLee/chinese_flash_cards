class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      flash[:success] = "You have created an account. Please log in."
      redirect_to signin_path
    else
      flash.now[:danger] = "Your account was not created."
      render :new
    end
  end



  private


  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

end