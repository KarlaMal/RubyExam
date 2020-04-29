class PostsController < ApplicationController
  def index
    @user = current_user
    @posts = Post.all
    @user.likes_count.order(:des)
  
  end

  def new
  end

  def create
    @user = current_user
    @post = @user.posts.create(post_params)
    if @post.valid?
      flash[:errors] = ['Post made!']
    else
      flash[:errors] = @post.errors.full_messages
    end
    redirect_to posts_path
  end

  def show
    @user = current_user
    @post = Post.find(params[:postid])
    @users = @post.people_liked
  end

  def destroy
    @post = Post.find(params[:postid])
    if @post && current_user == @post.user
      Post.destroy(@post)
    else
      flash[:error] = ['Failed to deleted']
    end
    redirect_to posts_path
  end

  private
  def post_params
      params.require(:post).permit(:content).merge(user: current_user)
  end
end
