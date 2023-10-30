class PostController < ApplicationController
  def index
    @posts = Post.where(author_id: params["user_id"]).all
  end

  def show
    @user = User.find_by(id: params["user_id"])
    @post = @user.posts.find_by(id: params["id"])
  end
end