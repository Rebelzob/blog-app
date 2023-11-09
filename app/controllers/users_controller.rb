class UsersController < ApplicationController
  def index
    authorize! :index, User

    redirect_to user_path(current_user) if current_user && !current_user.admin?
    @users = User.all
  end

  def show
    @user = User.find(params['id'])
  end
end
