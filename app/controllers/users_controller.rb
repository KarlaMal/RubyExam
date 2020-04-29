class UsersController < ApplicationController
  def index
    
  end

  def new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:id] = @user.id
      flash[:error] = ['User Created, Login now']
    else 
      flash[:error] = @user.errors.full_messages
    end
    redirect_to login_path
  end

  def show
    @user = User.find(params[:id]) 
    @posts = @user.posts
    @likes = @user.liked_posts
    @numposts = @posts.count
    @alllikes = @likes.count
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :alias, :email, :password)
  end
end
