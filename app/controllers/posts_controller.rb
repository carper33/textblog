class PostsController < ApplicationController
  before_action :find_user

  # GET /posts
  # GET /posts.json
  def index
    @posts = @user.posts
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = @user.posts.find_by_slug(params[:id])
  end

  def find_user
    @user = User.find_by username: params[:user_name]
  end
             

end
