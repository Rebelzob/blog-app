class PostsController < ApplicationController
  before_action :find_user, only: %i[index show]
  load_and_authorize_resource

  def index
    @posts = @user.posts.includes(:comments).where(author_id: @user.id)
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def show
    @posts = @user.posts.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.build(post_params)

    if @post.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @post.likes.destroy_all
    @post.comments.destroy_all
    @post.destroy

    redirect_to user_post_path(@user, @post)
  end

  private

  def post_params
    params
      .require(:post)
      .permit(:title, :text)
  end
end
