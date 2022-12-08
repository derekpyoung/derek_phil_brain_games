class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index 
    @users = User.all 
    render 'users/index'
  end 

  def show
    id = params[:id]
    @user = User.find_by(id: id)
    render 'users/show'

  end 

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    user.save 
    redirect_to '/'
    
  end 

  def update 
    id = params[:id]
    u = User.find_by(id: id)
    if current_user.id == u.id 
      u.name = params[:name] || u.name 
      u.password = params[:password] || u.password
      u.password_confirmation = params[:password_confirmation] || u.password_confirmation
      u.email = params[:email] || u.email 
      u.save  
    end 
  end 

  def destroy 
    id = params[:id]
    u = User.find_by(id: id)
    u.delete 

  end 
end
