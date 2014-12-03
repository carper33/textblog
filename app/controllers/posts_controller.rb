class PostsController < ApplicationController
  before_action :find_user, except: :all
  before_action :find_post, except: [:all, :index, :new]

  helper_method :can_edit?, :can_create?

  # GET /posts
  # GET /posts.json
  def index
    @posts = @user.posts
  end

  def new
    @post = Post.new(user_id: current_user.id)
  end

  def create
    @post = @user.posts.create(post_params)
    redirect_to post_path(@user.username, @post)
  end


  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  def find_user
    @user = User.find_by_username(params[:user_name])
  end

  def find_post
    @post = @user.posts.find_by_slug(params[:id])
  end

  def all
    @posts = Post.all
  end

  def edit
    if current_user != @post.user
      render text: "Not found", status: 404
    else
      render action: "edit"
    end
  end

  def update
    puts "HEY"
    puts post_params
    puts "HO"
    @post.update_attributes(post_params)
    redirect_to post_path(@post.user.username, @post)
  end

  def can_edit?(post)
    post.user == current_user
  end

  def can_create?
    @user == current_user
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
