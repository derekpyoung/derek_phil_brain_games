class SessionsController < ApplicationController
 
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully Logged In!"
      p "logged in"
      redirect_to "/users/#{current_user.id}"
    else
      flash[:warning] = 'Invalid Username or Password'
      redirect_to "/users/"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Successfully Logged Out!'
    p "logged out"
    redirect_to "/users"
  end
end
