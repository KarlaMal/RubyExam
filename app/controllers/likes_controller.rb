class LikesController < ApplicationController
  def new
  end

  def create
    @user = current_user
    @post = Post.find(params[:postid])
    @like = Like.create(user:@user, post: @post)
    redirect_to posts_path
  end
  def destroy
    @like = Like.find(params[:like_id])
    @like.destroy
    redirect_to posts_path
  end

  private
  def like_params
    params.require(:like).permit(user:current_user, post: params[:id])
  end
end
