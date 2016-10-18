class UsersController < ApplicationController

  def new
  end

  def create
    # email = user_params[:email].strip
    # user = User.new(first_name: user_params[:first_name], last_name: user_params[:last_name], email: email, password: user_params[:password], password_confirmation: user_params[:password_confirmation])
     user = User.new(user_params)
     user.email = user.email.strip
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/users/new'
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
      )
  end

end
