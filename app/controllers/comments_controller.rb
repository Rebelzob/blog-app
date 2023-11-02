class CommentsController < ApplicationController
  def new
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end
  
  def create
    @user = current_user
    @comment = @user.comments.build(comment_params)
    
    if @comment.save
      redirect_to user_post_path(@user, params[:post_id])
    else
      render :new
    end
  end

  private

  def comment_params
    params
      .require(:comment)
      .permit(:text)
      .merge(post_id: params[:post_id])
  end
end