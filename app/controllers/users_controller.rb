class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Your account was created sucessfully."
      session[:user_id] = @user.id
      redirect_to "/"
    else
      flash[:alert] = "There was a problem signing you up."
      redirect_to :back
    end
  end

  def destroy
  end


private

def user_params
  params.require(:user).permit(:email, :password, :password_confirmation)
end

end
