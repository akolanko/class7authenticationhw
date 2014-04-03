class SessionsController < ApplicationController
  def new
  end

 def create
  	@user = User.authenticate(params[:email], params[:password])
  		if @user
  			flash[:notice] = "You have been logged in sucessfully."
  			session[:user_id] = @user.id
  			redirect_to "/"
  		else
  			flash[:alert] = "There was a problem logging you in."
  			redirect_to login_path
  		end
  end

  def destroy
  	session[:user_id] = nil
  	flash[:notice] = "You have been logged out successfully."
  	redirect_to "/"
  end


end
