class Api::PostsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:index]
  before_action :set_user, only: [:index]

end