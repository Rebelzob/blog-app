class CommentsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @user = User.find(params[:user_id])
    @comment = @user.comments.build(comment_params)

    if @comment.save
      redirect_to user_post_path(@user, params[:post_id])
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @comment = @user.comments.find(params[:id])
    @comment.destroy

    redirect_to user_post_path(@user, params[:post_id])
  end

  private

  def comment_params
    params
      .require(:comment)
      .permit(:text)
      .merge(post_id: params[:post_id])
  end
end
